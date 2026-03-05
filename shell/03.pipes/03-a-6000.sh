# Копирайте <РЕПО>/exercises/data/emp.data във вашата home директория.
cp /srv/fmi-os/exercises/data/emp.data ~/

# Посредством awk, използвайки копирания файл за входнни данни, изведете:

# - общия брой редове
awk 'END {print NR}' emp.data

# - третия ред
awk 'NR==3 {print}' emp.data

# - последното поле от всеки ред
awk '{print$3}' emp.data

# - последното поле на последния ред
awk 'END {print$NF}' emp.data

# - всеки ред, който има повече от 4 полета
awk 'NF>4 {print}' emp.data

# - всеки ред, чието последно поле е по-голямо от 4
awk '$NF>4 {print}' emp.data

# - общия брой полета във всички редове
awk '{sum += NF} END {print sum}' emp.data

# - броя редове, в които се среща низът Beth
awk '/Beth/ {count++} END {print count}' emp.data

# - най-голямото трето поле и редът, който го съдържа
awk 'BEGIN {max = 0} {if ($3>max) {max=$3; line=$0}} END {print max,line}' emp.data

# - всеки ред, който има поне едно поле
awk 'NF>=1 {print}' emp.data

# - всеки ред, който има повече от 17 знака
awk 'lenght($0) > 17 {print}' emp.data

# - броя на полетата във всеки ред и самият ред
awk '{print NF,$0}' emp.data

# - първите две полета от всеки ред, с разменени места
awk '{print $2,$1}' emp.data

# - всеки ред така, че първите две полета да са с разменени места
awk '{t=$1; $1=$2; $2=t} {print}' emp.data

# - всеки ред така, че на мястото на първото поле да има номер на реда
awk '{$1 = NR} {print}' emp.data

# - всеки ред без второто поле
awk '{$2=""} {print}' emp.data

# - за всеки ред, сумата от второ и трето поле
awk '{sum = $2+$3} {print sum}' emp.data

# - сумата на второ и трето поле от всеки ред
awk '{sum += $2+$3} END {print sum}' emp.data
