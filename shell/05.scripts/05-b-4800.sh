# Да се напише shell скрипт, който приема файл и директория.
# Скриптът проверява в подадената директория и нейните под-директории дали съществува копие на подадения файл и 
# отпечатва имената на намерените копия, ако съществуват такива.

# NB! Под 'копие' разбираме файл със същото съдържание.

#!/bin/bash

if [ "$#" -ne 2 ] ; then 
    echo "Invalid number parameters" 
    exit 1
fi

file="$1"
dir="$2"

if [[ ! -f "$file" ]]; then
    echo "File does not exist"
    exit 2
fi

if [[ ! -d "$dir" ]]; then
    echo "Directory does not exist"
    exit 3
fi

find "$dir" -type f -exec cmp -s "$file" {} \; -print
