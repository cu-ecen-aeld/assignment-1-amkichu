#!/bin/bash

# Accepts the following arguments: 
# the first argument is a full path to a file (including filename) on the filesystem, referred to below as writefile; 
# the second argument is a text string which will be written within this file, referred to below as writestr

# Exits with value 1 error and print statements if any of the arguments above were not specified

# Creates a new file with name and path writefile with content writestr, 
# overwriting any existing file and creating the path if it doesn’t exist. 
# Exits with value 1 and error print statement if the file could not be created.

# Example:
#        writer.sh /tmp/aesd/assignment1/sample.txt ios

# Creates file:
#     /tmp/aesd/assignment1/sample.txt
#             With content:
#             ios

# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Both arguments (writefile and writestr) are required."
    exit 1
fi

writefile="$1"
writestr="$2"

# Check if writefile is provided as an argument
if [ -z "$writefile" ]; then
    echo "Error: writefile argument is required."
    exit 1
fi

# Check if writestr is provided as an argument
if [ -z "$writestr" ]; then
    echo "Error: writestr argument is required."
    exit 1
fi

# Extract directory path from writefile
dir=$(dirname "$writefile")

# Create directory if it doesn't exist
if [ ! -d "$dir" ]; then
    mkdir -p "$dir"
fi

# Create the file and write the content
echo "$writestr" > "$writefile"

# Check if file creation was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to create the file $writefile."
    exit 1
fi

echo "File $writefile created successfully with content:"
cat "$writefile"
