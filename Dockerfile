# Use official OpenJDK image
FROM openjdk:21-jdk-slim

# Set working directory
WORKDIR /app

# Copy the pom.xml and install dependencies
COPY pom.xml
RUN mvn dependency:go-offline

# Copy built JAR file (after mvn package)
COPY target/lib-man-0.0.1-SNAPSHOT.jar app.jar

# Expose backend port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
