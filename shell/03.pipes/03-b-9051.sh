# Използвайки файл population.csv, намерете колко е общото население на света през 2008 година. А през 2016?

cat ~/population.csv | grep ',2008,' | cut -d ',' -f4 | awk 'BEGIN{all=0} {all+=$0} END{print all}
cat ~/population.csv | grep ',2016,' | cut -d ',' -f4 | awk 'BEGIN{all=0} {all+=$0} END{print all}
