#!/bin/bash

# This script demonstrates a solution to avoid the race condition.
# It uses find to get a snapshot of the files before processing.

# Set the directory to process
directory="/tmp/testdir"

# Create the directory if it doesn't exist
mkdir -p "$directory"

# Create some test files
touch "$directory/file1.txt"
touch "$directory/file2.txt"

# Use find to get a list of files *before* the loop
files=("$(find "$directory" -maxdepth 1 -type f -print0 | xargs -0)")

# Loop through the files from the snapshot
for file in "${files[@]}"; do
  # Process each file
  echo "Processing file: $file"
  # ...more processing code here...
  rm -f "$file"
  echo "Finished processing file: $file"
done