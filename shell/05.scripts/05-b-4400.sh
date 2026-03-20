# Напишете shell script, който да приема параметър име на директория, от която взимаме файлове, 
# и опционално експлицитно име на директория, в която ще копираме файлове. 
# Скриптът да копира файловете със съдържание, променено преди по-малко от 45 мин,
# от първата директория във втората директория. Ако втората директория не е подадена по име, 
# нека да получи такова от днешната дата във формат, който ви е удобен.
# При желание новосъздадената директория да се архивира.

#!/bin/bash

if [[ "$#" -ne 1 && "$#" -ne 2 ]] ; then
    echo "Incorect usage" 
    exit 1

fi

dir1="$1"

if [[ ! -d "$dir1" ]]; then
    echo "Source directory does not exist"
    exit 1
fi

if [ "$#" -eq 1 ] ; then 
    dir2=$(date +%F) 
else 
    dir2="$2"
fi

mkdir -p "$dir2"

find "$dir1" -type f -amin -45 -exec cp {} "$dir2" \;
echo "Files are copied in $dir2"

read -p "Do you want to archive the directory? (y/n): " answer

if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    tar -czf "$dir2.tar.gz" "$dir2"
    echo "Archive created: $dir2.tar.gz"
fi
