Имате компилируем (a.k.a няма синтактични грешки) source file на езика C. Напишете shell script, който да покaзва колко е дълбоко най-дълбокото nest-ване (влагане).
Примерен .c файл:

#include <stdio.h>

int main(int argc, char *argv[]) {

  if (argc == 1) {
		printf("There is only 1 argument");
	} else {
		printf("There are more than 1 arguments");
	}

	return 0;
}
Тук влагането е 2, понеже имаме main блок, а вътре в него if блок.

Примерно извикване на скрипта:

./count_nesting sum_c_code.c

Изход:
The deepest nesting is 2 levels

#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <c_source_file>"
    exit 1
fi

file="$1"

if [ ! -f "$file" ]; then
    echo "File does not exist."
    exit 1
fi

max_depth=0
current_depth=0

while IFS= read -r line; do
    opens=$(echo "${line}" | grep -o '{' | wc -l)
    closes=$(echo "${line}" | grep -o '}' | wc -l)

    current_depth=$((current_depth + opens))

    if [ "${current_depth}" -gt "${max_depth}" ]; then
        max_depth=${current_depth}
    fi

    current_depth=$((current_depth - closes))
done < "$file"

echo "The deepest nesting is ${max_depth} levels"
