# Изведете имената на хората с второ име по-късо от 8 (<=7) символа според /etc/passwd // !(>7) = ?

cat /etc/passwd | cut -d ':' -f5 | cut -d ',' -f1 | awk 'length($2)<=7 {print}'
