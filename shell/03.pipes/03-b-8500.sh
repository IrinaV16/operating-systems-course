# За всяка група от /etc/group изпишете "Hello, <група>",
# като ако това е вашата група, напишете "Hello, <група> - I am here!".

cat /etc/group | cut -d ':' -f1 | awk -v g=$(id -gn) '{ if ($0 == g) print "Hello, " $0 " - I am here!"; else print "Hello, " $0 }'
