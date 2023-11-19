#!/bin/bash

# Визначаємо значення n. Якщо параметр не задано, використовуємо значення 5.
n=${1:-5}

# Перевіряємо, чи існує вже файл top_output.txt та видаляємо його.
[ -e top_output.txt ] && rm top_output.txt

# Виконуємо утиліту "top" і перенаправляємо її вміст у файл "top_output.txt".
top -n 1 -b > top_output.txt || { echo "Помилка при виконанні утиліти top."; exit 1; }

# Перевіряємо, чи створений файл і його розмір більше 0 перед обрізкою.
[ ! -s top_output.txt ] && { echo "Утиліта top не повернула даних."; exit 1; }

# Обрізаємо файл "top_output.txt", залишаючи тільки перші n рядків.
head -n $n top_output.txt > top_output_trimmed.txt || { echo "Помилка при обрізанні файлу."; exit 1; }

# Виведення змісту обрізаного файлу за допомогою cat.
cat top_output_trimmed.txt

