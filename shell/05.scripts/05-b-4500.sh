# Да се напише shell скрипт, който получава при стартиране като параметър в командния ред идентификатор на потребител. 
# Скриптът периодично (sleep(1)) да проверява дали потребителят е log-нат, и ако да - да прекратява изпълнението си,
# извеждайки на стандартния изход подходящо съобщение.

# NB! Можете да тествате по същият начин като в 05-b-4300.txt

#!/bin/bash

if [ "$#" -ne 1 ] ; then
    echo "Invalid usage" 
    exit 1
fi

fullname="$1"

username=$(grep ":$fullname," /etc/passwd | cut -d: -f1)

if [ -z "$username" ]; then
    echo "User with name '$fullname' not found"
    exit 1
fi

while true; do
    if who | grep -q "^$username"; then
        echo "User $username is logged in"
        exit 0
    fi

    sleep 1
done
