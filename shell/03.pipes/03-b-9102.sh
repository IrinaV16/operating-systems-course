# Да се изведат само имената на песните.

find ~/songs -maxdepth 1 -type f | cut -d '-' -f2 | cut -d '(' -f1
