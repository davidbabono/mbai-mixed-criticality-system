#!/bin/bash

INPUT_FILE=sod.o
OUTPUT_FILE=sod_renamed.o
SYMBOLS_FILE=binary_text_symbols.txt

cp $INPUT_FILE $OUTPUT_FILE

while read -r line; do
  ORIGINAL_SECTION_NAME=".text.$line"
  NEW_SECTION_NAME=".text.sharedlib.$line"
  objcopy --rename-section $ORIGINAL_SECTION_NAME=$NEW_SECTION_NAME $OUTPUT_FILE $OUTPUT_FILE
done < $SYMBOLS_FILE

