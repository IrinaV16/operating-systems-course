# Намерете броя на символите, различни от буквата 'а' във файла /etc/passwd

cat /etc/passwd | grep -o . | grep -v a | wc -l
