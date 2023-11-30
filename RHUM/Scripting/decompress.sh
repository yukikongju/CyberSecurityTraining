#!/bin/bash
filename=flag.zip
# filename=flag.7z
# filename=flag.tar.gz
compressed_extensions=('zip' '7z' 'gz')

while true; do
    # 1. get file base and extension
    extension="${filename##*.}"
    base="${filename%.*}"

    if [[ ! " ${compressed_extensions[@]} " =~ " $extension " ]]; then
        break
    fi

    # 2. decompress file
    case $extension in
	zip)
	    unzip -q "$filename"  ;;
	7z)
	    7z x "$filename"  ;;
	gz)
	    tar xf "$filename"  ;; 
    esac

    # 3. get new file name
    files=(*)
    if [ ${#files[@]} -ne 2 ]; then
	for file in "${files[@]}"; do
	    ext="${file##*.}"
	    # echo "$ext"
	    if [ "$file" == "$filename" ]; then
		rm "$file"
	    elif [ "$file" != "$filename" ] && [ "$ext" != ".sh" ]; then
		extension="$ext"
		# echo "$extension"
	    fi
	done
    fi
done
