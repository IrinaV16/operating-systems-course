# Да се напише shell скрипт, който приканва потребителя да въведе пълното име на директория и 
# извежда на стандартния изход подходящо съобщение за броя на всички файлове и всички директории в нея.

#!/bin/bash

read -p "Enter full name of directory: " directory

if [[ ! -d "${directory}" ]] ; then
    echo "No such directory exists!"
    exit 1
fi

filesNumber=$(find "${directory}" -type f | wc -l)
directoriesNumber=$(find "${directory}" -type d | wc -l)

echo "Number of files are: ${filesNumber} and directories are: ${directoriesNumber}"
