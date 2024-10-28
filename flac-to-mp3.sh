# Set the input folder path as an argument
INPUT_FOLDER=$1

# Check if the input folder path is provided
if [ -z "$INPUT_FOLDER" ]; then
  echo "Error: Please provide the folder path as an argument."
  exit 1
fi

# Check if the input folder exists
if [ ! -d "$INPUT_FOLDER" ]; then
  echo "Error: The specified folder does not exist."
  exit 1
fi

# Iterate through the files in the input folder
for file in "$INPUT_FOLDER"/*.flac; do
  # Check if the item is a regular file (not a directory)
  if [ -f "$file" ]; then
    echo "Converting... $file"
    ffmpeg -i "$file" -ab 320k "${file/%flac/mp3}"
  fi
done
