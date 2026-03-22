# Да се напише shell скрипт, който получава единствен аргумент директория и изтрива всички повтарящи се (по съдържание)
# файлове в дадената директория. Когато има няколко еднакви файла, да се остави само този,
# чието име е лексикографски преди имената на останалите дублирани файлове.

Примери:
$ ls .
f1 f2 f3 asdf asdf2
# asdf и asdf2 са еднакви по съдържание, но f1, f2, f3 са уникални

$ ./rmdup .
$ ls .
f1 f2 f3 asdf
# asdf2 е изтрит


#!/bin/bash

if [ "$#" -ne 1 ] ; then
    echo "Enter one parametar(directory)"
    exit 1
fi

dir="$1"

if [[ ! -d "$dir" ]] ; then
    echo "Directory does not exist"
    exit 2
fi

files=$(find "$dir" -maxdepth 1 -type f | sort)

for f1 in $files; do
    for f2 in $files; do
        if [[ "$f1" < "$f2" ]] && cmp -s "$f1" "$f2"; then
            rm "$f2"
        fi
    done
done
