#!/bin/bash

# This script attempts to process files in a directory, but it has a subtle bug.
# It uses a loop that may not always work as expected.

# Set the directory to process
directory="/tmp/testdir"

# Create the directory if it doesn't exist
mkdir -p "$directory"

# Create some test files
touch "$directory/file1.txt"
touch "$directory/file2.txt"

# Loop through each file in the directory
for file in "$directory"/*; do
  # Process each file
  echo "Processing file: $file"
  # Introduce a race condition (bug)
  sleep 1  # This is an artificial delay to simulate another task
  # ...more processing code here...
  rm -f "$file" 
  #rm "$file"
  echo "Finished processing file: $file"
done