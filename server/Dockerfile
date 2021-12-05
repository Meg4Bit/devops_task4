FROM openjdk:8
LABEL maintainer="ametapod"


COPY wait-for-it.sh /var/tmp
COPY /DostavimVse /var/DostavimVse

WORKDIR /var/DostavimVse

RUN ./mvnw clean package -P init-base -DskipTests

ENTRYPOINT /var/tmp/wait-for-it.sh db:3036 -- java -jar target/dostavimvse-0.0.1-SNAPSHOT.jar && ./mvnw clean package -P web-app && java -jar target/dostavimvse-0.0.1-SNAPSHOT.jar

EXPOSE 8080
