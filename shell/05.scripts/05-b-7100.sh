# Да се напише shell скрипт, който приема два параметъра - име на директория и число.Скриптът да извежда на стандартния
# изход имената на всички обикновени файлове във директорията, които имат размер, по-голям от подаденото число.

#!/bin/bash

if [[ "$#" -ne 2 ]]; then 
    echo "Wrong parameters entered"
    exit 2
fi

dir=$1
number=$2

if [[ ! -d "$dir" ]]; then
    echo "There is no such directory"
    exit 2
fi

find "$dir" -maxdepth 1 -type f -size +"${number}c" -printf "%f\n"
