#!/bin/ash
# This script accepts a URL and an output file path, then downloads the file with a spinner.

# Check if the correct number of arguments is passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <download_url> <output_file_path>"
    exit 1
fi

# Get input arguments
DOWNLOAD_URL="$1"
OUTPUT_FILE="$2"

# Spinner function
#spinner() {
#    local pid=$!
#    local spinstr='-\|/'
#    local i=0
#    echo -n 'Downloading... '
#    while kill -0 "$pid" 2>/dev/null; do
#        i=$(( (i+1) %4 ))
#        printf "\b${spinstr:$i:1}"
#        sleep .1
#    done
#    echo
#}
echo -n "Downloading $OUTPUT_FILE... "
# Perform the download in the background
curl -o -sS ${OUTPUT_FILE} ${DOWNLOAD_URL} &

# Call the spinner while curl is running
#spinner

echo "Download complete!"
