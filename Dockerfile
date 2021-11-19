FROM debian:buster
LABEL maintainer="ametapod"
# Устанавливаем зависимости
RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install cmake
# Задаём текущую рабочую директорию
# WORKDIR /var/www/html/
# Копируем код из локального контекста
COPY ./task6/cmake-with-flask .

# Настраиваем команду, которая должна быть запущена в контейнере во время его выполнения
ENTRYPOINT bash

# Открываем порты
EXPOSE 80 443
