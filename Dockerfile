FROM eclipse-temurin:21-jdk-jammy
WORKDIR /app
COPY target/*.jar stock101.jar
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=prod", "stock101.jar"]