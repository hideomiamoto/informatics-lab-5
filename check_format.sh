#!/bin/bash

echo "Проверка формата .txt файлов..."

files=$(git diff --cached --name-only --diff-filter=ACM | grep '\.txt$')

if [ -z "$files" ]; then
  echo "Файлы .txt для проверки не найдены."
  exit 0
fi

for file in $files; do
  if [ ! -s "$file" ]; then
    echo "Ошибка: файл $file пустой."
    exit 1
  fi

  if grep -n '[[:blank:]]$' "$file"; then
    echo "Ошибка: в файле $file есть пробелы в конце строк."
    exit 1
  fi
done

echo "Проверка .txt файлов пройдена успешно."
exit 0
