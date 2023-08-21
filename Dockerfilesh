FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
COPY run.sh .
COPY build/libs/*.jar app.jar
ENTRYPOINT ["run.sh"]