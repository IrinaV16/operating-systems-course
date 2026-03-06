# Колко коментара има във файла /etc/services ? Коментарите се маркират със символа #, след който всеки символ на реда се счита за коментар.

awk '/^#/ {count++} END {print count}' /etc/services
#or
cat /etc/services | awk /^#/ | wc -l
#OR
cat /etc/services | grep "^#" | wc -l
