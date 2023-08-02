#!/bin/bash

INPUT_FILE=sod_renamed.o
OUTPUT_FILE=sod_renamed_final.o
SYMBOLS_FILE=rodata_list.txt

cp $INPUT_FILE $OUTPUT_FILE

while read -r line; do
  ORIGINAL_SECTION_NAME=".rodata.$line"
  NEW_SECTION_NAME=".rodata.sharedlib.$line"
  objcopy --rename-section $ORIGINAL_SECTION_NAME=$NEW_SECTION_NAME $OUTPUT_FILE $OUTPUT_FILE
done < $SYMBOLS_FILE

