FROM maven:latest AS builder

ENV MAVEN_VERSION 3.2.5

COPY . /data/springboot-helloworld
WORKDIR /data/springboot-helloworld

RUN ["mvn", "clean", "install", "-DskipTests"]

FROM openjdk:8

COPY --from=builder /data/springboot-helloworld/target/helloworld-0.0.1-SNAPSHOT.jar /jar/hello.jar

EXPOSE 8080

CMD ["java", "-jar", "/jar/hello.jar"]

