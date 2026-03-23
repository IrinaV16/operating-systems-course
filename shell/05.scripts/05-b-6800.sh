# Да се напише shell скрипт, който получава единствен аргумент директория и 
# отпечатва списък с всички файлове и директории в нея (без скритите).
# До името на всеки файл да седи размера му в байтове, а до името на всяка директория да седи броят на 
# елементите в нея (общ брой на файловете и директориите, без скритите).

a) Добавете параметър -a, който указва на скрипта да проверява и скритите файлове и директории.

Пример:
$ ./list.sh .
asdf.txt (250 bytes)
Documents (15 entries)
empty (0 entries)
junk (1 entry)
karh-pishtov.txt (8995979 bytes)
scripts (10 entries)

#!/bin/bash

if [[ "$#" -ne 1 ]] ; then
    echo "Enter one directory"
    exit
fi

dir="$1"

if [[ ! -d "$dir" ]] ; then
    echo "Directory not found"
    exit 2
fi

finds=$(find "$dir" -maxdepth 1 ! -name ".*")

for find in $finds; do
    if [[ "$find" == "$dir" ]]; then
        continue
    elif [[ -f "$find" ]] ; then 
        bytes=$(cat "$find" | wc -c)
        echo "$(basename "$find") ($bytes)"
    elif [[ -d "$find" ]] ; then
        count=$(find "$find" -mindepth 1 -maxdepth 1 ! -name ".*"| wc -l)

        if [[ "$count" -eq 1 ]] ; then
            echo "$(basename "$find") ($count entry)"
        else
            echo "$(basename "$find") ($count entries)"    
        fi
    fi
done
