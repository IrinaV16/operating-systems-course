# Намерете файловете в /bin, които могат да се четат, пишат и изпълняват от всички.

find /bin -type f -perm -u=rwx,g=rwx,o=rwx
# OR
find /bin -type f -perm -777
