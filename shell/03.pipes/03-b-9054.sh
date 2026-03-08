# Използвайки файл population.csv, намерете коя държава е на 42-ро място по
# население през 1969. Колко е населението й през тази година?

cat population.csv | grep ',1969,' | sort -t ',' -k4 -n | head -n 42 | tail -n 1 | awk -F ',' '{print "year: " $3 " country: " $1 " population: " $4}'
