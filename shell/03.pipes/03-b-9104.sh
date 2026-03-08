# Да се изведат всички албуми, сортирани по година.

find ~/songs -type f | cut -d '(' -f2 | cut -d ')' -f1 | sort -t ',' -k2 -n 
