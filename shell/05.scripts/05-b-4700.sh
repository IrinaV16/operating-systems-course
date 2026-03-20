# Да се напише shell скрипт, който форматира големи числа, за да са по-лесни за четене.
# Като пръв аргумент на скрипта се подава цяло число.
# Като втори незадължителен аргумент се подава разделител. По подразбиране цифрите се разделят с празен интервал.

Примери:
$ ./nicenumber.sh 1889734853
1 889 734 853

$ ./nicenumber.sh 7632223 ,
7,632,223

#!/bin/bash

if [[ "$#" -lt 1 || "$#" -gt 2 ]]; then
    echo "Usage: $0 <number> [separator]"
    exit 1
fi

num="$1"
sep="${2:- }"

if ! [[ "$num" =~ ^-?[0-9]+$ ]]; then
    echo "Invalid number"
    exit 2
fi

result=$(echo "$num" | rev | sed "s/\([0-9]\{3\}\)/\1$sep/g" | rev)

result=$(echo "$result" | sed "s/^$sep//")

echo "$result"
