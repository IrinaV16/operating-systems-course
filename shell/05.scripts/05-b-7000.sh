# Да се напише shell скрипт, който приема произволен брой аргументи - имена на файлове. 
# Скриптът да прочита от стандартния вход символен низ и за всеки от зададените файлове извежда по подходящ начин 
# на стандартния изход броя на редовете, които съдържат низа.

NB! Низът може да съдържа интервал.

#!/bin/bash

read -p "Enter string for file" string

for file in "$@"; do 
    if [[ ! -f "$file" ]]; then
        echo "$file is not a valid file"
        continue
    fi
    rows=$(grep "$string" "$file" | wc -l)
    echo "Number of rows: $rows"
done
