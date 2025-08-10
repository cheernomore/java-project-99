FROM eclipse-temurin:21-jdk as build
WORKDIR .
COPY . .
RUN gradle bootJar --no-daemon

FROM eclipse-temurin:21-jdk
WORKDIR .
COPY --from=build /build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]