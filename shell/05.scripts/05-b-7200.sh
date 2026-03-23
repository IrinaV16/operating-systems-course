# Да се напише shell скрипт, който приема произволен брой аргументи - имена на файлове или директории. 
# Скриптът да извежда за всеки аргумент подходящо съобщение:
#	- дали е файл, който може да прочетем
#	- ако е директория - имената на файловете в нея, които имат размер, по-малък от броя на файловете в директорията.

#!/bin/bash

for argument in "$@"; do 
    if [[ -f "$argument" ]]; then 
        if [[ -r "$argument" ]]; then
            echo "$argument is a readable file"
        else
            echo "$argument is not a readable file"
        fi
    elif [[ -d "$argument" ]]; then 
        numberFiles=$(find "$argument" -maxdepth 1 -type f | wc -l)
        find "$argument" -maxdepth 1 -type f -size -"${numberFiles}c" -printf "%f\n"
    fi
done
