read -r -a array <<< "${@}"

search="${array[@]}/*.flac"
echo "$search"

for a in "$search"; do
  echo "$a";
  ffmpeg -i "$a" -qscale:a 0 "${a[@]/%flac/mp3}"
done
