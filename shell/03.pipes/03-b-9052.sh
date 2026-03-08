# Използвайки файл population.csv, намерете през коя година в България има най-много население.

cat population.csv | grep 'Bulgaria' | sort -t ',' -k4 -nr | head -n 1 | awk -F ',' '{print $3}'
