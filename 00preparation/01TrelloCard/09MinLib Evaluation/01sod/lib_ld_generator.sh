#!/bin/bash

# Initial setup
TEMP_FILE="temp.txt"
SYMBOLS_FILE="symbols.txt"
LINKER_SCRIPT="debloating_lib.ld"
BACKUP_LINKER_SCRIPT="debloating_orig.ld"
TEMP_LINKER_SCRIPT="debloating_temp.ld"

# Ensure that we have a backup of the original linker script
if [ ! -f $BACKUP_LINKER_SCRIPT ]; then
    cp $LINKER_SCRIPT $BACKUP_LINKER_SCRIPT
fi

cp $BACKUP_LINKER_SCRIPT $TEMP_LINKER_SCRIPT

# Create a file that contains all unique undefined symbols
OUT_FILE="unique_symbols.txt"


#######################################################################################################################
# Create a temporary copy of the linker script
#  if ($0 ~ /= SIZEOF_HEADERS;/) {
awk -v symbols_file="$OUT_FILE" '
{
  print $0
  if ($0 ~ /PROVIDE \(__executable_start = SEGMENT_START\("text-segment", 0x400000\)\); \. = SEGMENT_START\("text-segment", 0x400000\) \+ SIZEOF_HEADERS;/) {
    print ".sharedlib 0x80000000 : {"
    while (getline symbol < symbols_file) {
      print "  KEEP(*(\".text." symbol "\"))"
      print "  KEEP(*(\".data." symbol "\"))"
    }
    print "}"
  }
}' $TEMP_LINKER_SCRIPT > $LINKER_SCRIPT

# Clean up the temporary linker script
rm $TEMP_LINKER_SCRIPT
