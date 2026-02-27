# Отпечатайте имената на всички директории в директорията /home.

find /home -maxdepth 1 -type d -printf "%f\n"
