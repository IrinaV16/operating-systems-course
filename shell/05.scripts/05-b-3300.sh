# Да се напише shell скрипт, който чете от стандартния вход имената на 3 файла, 
# обединява редовете на първите два (man paste), подрежда ги по азбучен ред и резултата записва в третия файл.

#!/bin/bash
read -p "Enter first file name: " file1

if [[ ! -f "${file1}" ]]; then
        echo "File ${file1} does not exist."
        exit 1
fi

read -p "Enter second file name: " file2

if [[ ! -f "${file2}" ]]; then
        echo "File ${file2} does not exist."
        exit 1
fi

read -p "Enter third file name: " file3

if [[ ! -f "${file3}" ]]; then
        touch "${file3}"
fi

paste "${file1}" "${file2}" | sort >> "${file3}"
