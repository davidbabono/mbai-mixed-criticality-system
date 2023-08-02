#build the regular application
make -f Makefile.orig samples

#build the application and using nm -u to generate the undefined symbols list
make samples
make udsymbols
#create the linker script and keep the undefined symbols list inside
lib_ld_generator.sh
#generate the sod library object file
make lib
#generate the sod binary with gc-section and linker script with KEEP
make sod_bin
#generate the sod binary with gc-section and linker script without KEEP
make sod_bin_min
#genearte the symbols 
nm -C sod_bin > sod_bin.txt
nm -C sod_bin_min > sod_bin_min.txt

#extract only the symbol names and section names from the two text files, sort the results, and save them to two new text files
awk '{print $2, $3}' sod_bin.txt | sort > binary1_symbols.txt
awk '{print $2, $3}' sod_bin_min.txt | sort > binary2_symbols.txt

#Compare the two sorted lists of symbol names and remove the ones that match in sod_bin:
comm -23 binary1_symbols.txt binary2_symbols.txt > binary_unique_symbols.txt

#filter out only symbols from .text and .data sections
grep -E '^(t|T) ' binary_unique_symbols.txt | awk '{print $2}' | sort > binary_text_symbols.txt
grep -E '^(d|D) ' binary_unique_symbols.txt | awk '{print $2}' | sort > binary_data_symbols.txt

#list .rodata sections from sod library
objdump -h sod.o | awk '{print $2}' | grep .rodata. > sod_rodata.txt
sed 's/\.rodata\.//g' sod_rodata.txt | sort > sod_rodata_sorted.txt
comm -12 sod_rodata_sorted.txt binary_data_symbols.txt > rodata_list.txt

#rename the text function section name
sh ./rename_text_section.sh
#rename the rodata section name
sh ./rename_rodata_section.sh

#build app with the combined object file 
make app_bins

#remove the sharedlib section from application

