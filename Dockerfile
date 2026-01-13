FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/*.jar stock101.jar
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=prod", "stock101.jar"]