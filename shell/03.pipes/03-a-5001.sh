# Изведете колко потребители не изпозват /bin/bash за login shell според /etc/passwd

cat /etc/passwd | grep -v '/bin/bash' | wc -l
