#!/bin/sh
exec java ${JAVA_OPTS} -jar /app.jar
exec java JAVA_OPTS=-Ddebug -Xmx128m -jar /app.jar
exec sh -c java -jar JAVA_OPTS=-Ddebug -Xmx128m /app.jar