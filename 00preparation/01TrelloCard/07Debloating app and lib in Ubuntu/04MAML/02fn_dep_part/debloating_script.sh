#!/bin/bash

# Initial setup
TEMP_FILE="temp.txt"
SYMBOLS_FILE="symbols.txt"
LINKER_SCRIPT="debloating.ld"
TEMP_LINKER_SCRIPT="debloating_temp.ld"

# Find all undefined symbols in object files and write them to a temporary file
#TBD 
#1 run makefile to generate the application.o
#2 get the undefined symbols list from all the application object files
for app in app*.c; do
  gcc -c -o "${app%.*}.o" "$app"
  nm -u "${app%.*}.o" | awk '{print $2}' >> $TEMP_FILE
done

# Sort symbols, remove duplicates, and add prefix
sort $TEMP_FILE | uniq | sed 's/^/.sharedlib./' > $SYMBOLS_FILE

#1 run makefile to generate the library.o
#2 update the undefined symbols name 

for lib in mylib*.o; do
  # Get all the function sections (.text.*) and data sections (.data.*) from the object file
  function_sections=$(objdump -h "$lib" | awk '/.text./ {print $2}')
  data_sections=$(objdump -h "$lib" | awk '/.data./ {print $2}')
  # Iterate over each function section
  for section in $function_sections; do
    # Strip the .text. prefix to get the original function name
    original_function="${section#.text.}"
    new_section=".sharedlib.${lib%.*}_$original_function"
    # Check if the function is in symbols.txt
    if grep -q "$original_function" $SYMBOLS_FILE; then
      # If the function is in symbols.txt, rename the section
      objcopy --rename-section "$section=$new_section" "$lib"
      # Update the function name in symbols.txt
      sed -i "s/^$original_function$/$new_section/" $SYMBOLS_FILE
    fi
  done
  # Iterate over each data section
  for section in $data_sections; do
    # Strip the .data. prefix to get the original variable name
    original_variable="${section#.data.}"
    new_section=".sharedlib.${lib%.*}_$original_variable"
    # Check if the variable is in symbols.txt
    if grep -q "$original_variable" $SYMBOLS_FILE; then
      # If the variable is in symbols.txt, rename the section
      objcopy --rename-section "$section=$new_section" "$lib"
      # Update the variable name in symbols.txt
      sed -i "s/^$original_variable$/$new_section/" $SYMBOLS_FILE
    fi
  done
done

#######################################################################################################################
# Create a temporary copy of the linker script
cp $LINKER_SCRIPT $TEMP_LINKER_SCRIPT

if ! grep -q "	.sharedlib 0x80000000 :" $LINKER_SCRIPT; then
# Insert the shared library section into the linker script
awk -v symbols_file="$SYMBOLS_FILE" '
{
  print $0
  if ($0 ~ /\.text.*: ALIGN\(4096\).*(.text.*) :text/) {
    print ".sharedlib 0x80000000 : { KEEP(*(SORT(.sharedlib.*))) }"
  }
}' $TEMP_LINKER_SCRIPT > $LINKER_SCRIPT
fi

# Remove temporary files
rm $TEMP_FILE $TEMP_LINKER_SCRIPT

