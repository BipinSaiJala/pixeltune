#!/bin/bash

echo "Starting CI test script..."

echo "Listing files:"
ls

echo "Creating file..."
touch deepu.txt

echo "Writing content..."
echo "hello deepu from github actions" > deepu.txt

echo "Reading file:"
cat deepu.txt

echo "Searching word deepu:"
grep -i deepu deepu.txt

echo "Script finished successfully!"