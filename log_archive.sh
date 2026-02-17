#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: $0 <directory_to_compress>"
    exit 1
fi

SOURCE_DIR="$1"
SOURCE_DIR="${SOURCE_DIR%/}"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

DIR_NAME=$(basename "$SOURCE_DIR")
PARENT_DIR=$(dirname "$SOURCE_DIR")

OUTPUT_FILENAME="${DIR_NAME}_${TIMESTAMP}.tar.gz"

echo "Compressing '$SOURCE_DIR' to '$OUTPUT_FILENAME'..."

tar -czf "$OUTPUT_FILENAME" -C "$PARENT_DIR" "$DIR_NAME"

echo "Done!"

