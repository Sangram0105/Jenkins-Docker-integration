FROM openjdk:8
EXPOSE 8080
ADD target/webone.war webone.war
ENTRYPOINT ["java","-jar","/webone.war"]