FROM maven:3.8.1-openjdk-8 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn package

FROM nithya890/tomcat
COPY --from=build /app/target/helloworld-1.0-SNAPSHOT.war /tomcat1/webapps
