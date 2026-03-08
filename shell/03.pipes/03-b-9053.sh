# Използвайки файл population.csv, намерете коя държава има най-много население през 2016.
cat population.csv | grep ',2016,' | sort -t ',' -k4 -nr | head -n 1| awk -F ',' '{print $1}

А коя е с най-малко население?
# (Hint: Погледнете имената на държавите)

cat population.csv | grep ',2016,' | sort -t ',' -k4 -n | head -n 1| awk -F ',' '{print $1}
