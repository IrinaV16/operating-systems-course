Напишете shell script, който автоматично да попълва файла указател от предната задача по подадени аргументи: име на файла указател, пълно име на човека (това, което очакваме да е в /etc/passwd) и избран за него nickname.
Файлът указател нека да е във формат:
<nickname, който лесно да запомните> <username в os-server>
// може да сложите и друг delimiter вместо интервал

Примерно извикване:
./pupulate_address_book myAddressBook "Ben Dover" uncleBen

Добавя към myAddressBook entry-то:
uncleBen <username на Ben Dover в os-server>

***Бонус: Ако има няколко съвпадения за въведеното име (напр. има 10 човека Ivan Petrov в /etc/passwd), всички те да се показват на потребителя, заедно с пореден номер >=1,
след което той да може да въведе някой от номерата (или 0 ако не си хареса никого), и само избраният да бъде добавен към указателя.

#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <address_book> \"Full Name\" <nickname>"
    exit 1
fi

file="$1"
fullname="$2"
nickname="$3"

# Търсим username по fullname (между : и ,)
username=$(grep ":$fullname," /etc/passwd | cut -d: -f1)

# Проверка дали е намерен
if [ -z "$username" ]; then
    echo "User with name '$fullname' not found"
    exit 1
fi

echo "$nickname $username" >> "$file"

echo "Added: $nickname $username"
