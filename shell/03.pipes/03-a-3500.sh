# Изпишете всички usernames от /etc/passwd с главни букви. 

cat /etc/passwd | cut -d ':' -f1 | tr 'a-z' 'A-Z'
