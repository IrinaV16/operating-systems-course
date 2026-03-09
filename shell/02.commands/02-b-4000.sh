# Копирайте най-малкия файл от тези, намиращи се в /etc, в home директорията си.

find /etc -maxdepth 1 -type f -printf "%s %f\n" | sort -n | head -n 1 | awk '{print $2}' | xargs -I {} cp /etc/{} ~
