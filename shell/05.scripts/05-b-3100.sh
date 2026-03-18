# Да се напише shell скрипт, който приканва потребителя да въведе низ - потребителско име на потребител от системата
# - след което извежда на стандартния изход колко активни сесии има потребителят в момента.

read -p 'Enter name' name

if ! grep -q $name /etc/passwd ; then
    echo "No person with ${name}"
    exit 1

fi

activeSession=$(who | grep $name | wc -l)
echo "The user has ${activeSessions) active sessions"
  
