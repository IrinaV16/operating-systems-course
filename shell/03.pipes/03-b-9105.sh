# Да се преброят/изведат само песните на Beatles и Pink.

find ~/songs -mindepth 1 | cut -d '/' -f 6 | grep -E 'Beatles -|Pink -' 
find ~/songs -mindepth 1 | cut -d '/' -f 6 | grep -E 'Beatles -|Pink -' | wc -l
