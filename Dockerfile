FROM openjdk:8
EXPOSE 8080
ADD target/webone.jar webone.jar
ENTRYPOINT["java","-jar","/webone.jar"]