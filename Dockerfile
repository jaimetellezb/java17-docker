# PASO 1: Usamos una imagen de gradle
FROM gradle:8.2.1-jdk17 AS build

# PASO 2: creamos una dirección de trabajo dentro de la imagen
WORKDIR /app

# PASO 3: copiamos el archivo build.gradle
COPY ./build.gradle .

# PASO 4: la carpeta source .src
COPY ./src ./src

# PASO 5: compilamos la aplicación usando gradle
RUN gradle build --no-daemon

# PASO 6: Utilizamos una imagen para Java 17
FROM --platform=linux/amd64 eclipse-temurin:17-jdk-alpine

# PASO 8: Copiamos el jar generado anteriormente en el PASO 5
COPY --from=build /app/build/libs/*.jar app.jar

# PASO 9: Configuramos el contenedor para que ejecute el jar
ENTRYPOINT ["java", "-jar", "/app/app.jar"]