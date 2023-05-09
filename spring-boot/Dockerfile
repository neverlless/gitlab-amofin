FROM maven:3.8.5-openjdk-17 as Build
COPY /src ./src
COPY /pom.xml /pom.xml
RUN mvn clean package

FROM openjdk:21-jdk-bullseye
COPY --from=Build ./target/hello-world-*.war ./hello-world.war
CMD ["java", "-jar", "./hello-world.war"]
EXPOSE 8080
