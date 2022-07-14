FROM openjdk:8
EXPOSE 8080
ADD target/devops-app1.jar devops-app1.jar
ENTRYPOINT ["java","-jar","/devops-app1.jar"]
