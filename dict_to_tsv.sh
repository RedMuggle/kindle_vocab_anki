#!/bin/bash

if [[ $# -ne 2 || "$1" = "-h" ]]
then
    echo "Usage: $0 DICT_EBOOK_FILE DICT_TSV_NAME"
    exit
fi

DICT_EBOOK_FILE="$1"
DICT_TSV_NAME="$2"
OUTPUT_FOLDER=~/gitrepos/kindle_vocab_anki/unpack_dict

if [[ ! -d "$OUTPUT_FOLDER" ]]
then
    mkdir "$OUTPUT_FOLDER"
fi

python ~/gitrepos/KindleUnpack/lib/kindleunpack.py "$DICT_EBOOK_FILE" "$OUTPUT_FOLDER" \
    && ~/gitrepos/kindle_vocab_anki/convert_dict.py "$OUTPUT_FOLDER/mobi7/book.html" "$DICT_TSV_NAME"


