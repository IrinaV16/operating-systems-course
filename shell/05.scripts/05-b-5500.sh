Да се напише shell script, който генерира HTML таблица съдържаща описание на
потребителите във виртуалката ви. Таблицата трябва да има:
- заглавен ред с имената нa колоните
- колони за username, group, login shell, GECOS field (https://en.wikipedia.org/wiki/Gecos_field)

#!/bin/bash

echo "<html>"
echo "<body>"
echo "<table border=\"1\">"

# заглавен ред
echo "<tr>"
echo "<th>Username</th>"
echo "<th>Group</th>"
echo "<th>Login Shell</th>"
echo "<th>GECOS</th>"
echo "</tr>"

# обхождаме /etc/passwd
while IFS=: read -r username _ uid gid gecos home shell; do
    echo "<tr>"
    echo "<td>$username</td>"
    echo "<td>$gid</td>"
    echo "<td>$shell</td>"
    echo "<td>$gecos</td>"
    echo "</tr>"
done < /etc/passwd

echo "</table>"
echo "</body>"
echo "</html>"
while IFS=: read -r username _ uid gid gecos home shell; do
    echo "<tr>"
    echo "<td>$username</td>"
    echo "<td>$gid</td>"
    echo "<td>$shell</td>"
    echo "<td>$gecos</td>"
    echo "</tr>"
done < /etc/passwd

echo "</table>"
echo "</body>"
echo "</html>"
