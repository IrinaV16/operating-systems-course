# Да се напише shell скрипт, който чете от стандартния вход име на файл и символен низ,проверява дали низа 
# се съдържа във файла и извежда на стандартния изход кода на завършване на командата,с която сте проверили наличието на низа.

# NB! Символният низ може да съдържа интервал (' ') в себе си.

#!/bin/bash

read -p "Enter file name: " file
if [[ ! -f "${file}" ]] ; then
    echo "There is no file with name: ${file}"
    exit 1
fi

read -p "Enter string: " string

grep -q "${string}" "${file}" 
echo ${?} 
