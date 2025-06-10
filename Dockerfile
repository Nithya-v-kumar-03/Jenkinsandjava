FROM maven:3.8.1-openjdk-8 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn package

FROM anilkumar1146/tomcat:1.0
COPY target/Example-0.0.1-SNAPSHOT.war /opt/tomcat/webapps/
