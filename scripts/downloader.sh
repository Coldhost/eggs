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
if curl -sS -o "${OUTPUT_FILE}" "${DOWNLOAD_URL}"; then
    echo "Download complete!"
else
    echo "Failed!"
    echo "Error: File download failed. Please check the URL or your network connection."
    curl -v "${DOWNLOAD_URL}" -o /dev/null
    exit 1
fi

# Verify the file is not empty
if [ ! -s "${OUTPUT_FILE}" ]; then
    echo "Error: Downloaded file is empty or not created."
    exit 1
fi

exit 0