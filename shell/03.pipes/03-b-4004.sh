# Направете нов файл с име по ваш избор, чието съдържание е конкатенирани съдържанията на file{1,2,3}.

touch dir5/concat
cat dir5/file1 dir5/file2 dir5/file3 > dir5/concat
