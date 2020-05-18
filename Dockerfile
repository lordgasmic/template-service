FROM openjdk:8
RUN mkdir /app
COPY target/recipe-parse-0.0.1-SNAPSHOT.jar /app
WORKDIR /app
CMD ["java", "-jar", "recipe-parse-0.0.1-SNAPSHOT.jar"]
