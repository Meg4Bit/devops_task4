FROM debian:buster
LABEL maintainer="ametapod"
# Устанавливаем зависимости
RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install build-essential
RUN apt-get -y install cmake
RUN apt-get -y install python3
RUN apt-get -y install python3-pip
RUN python3 -m pip install flask

# Копируем код из локального контекста
COPY task6/cmake-with-flask /var/cmake-with-flask

WORKDIR /var/cmake-with-flask/
RUN mkdir cmakefiles
RUN cmake -S . -B cmakefiles
RUN make -C cmakefiles

# Добавляем пользователя
RUN adduser --disabled-password techproguser

# Настраиваем команду, которая должна быть запущена в контейнере во время его выполнения
ENTRYPOINT python3 app.py --port=5000 --host=0.0.0.0

# Открываем порты
EXPOSE 80
