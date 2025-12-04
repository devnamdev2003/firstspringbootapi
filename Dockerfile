# Use Java 17
FROM eclipse-temurin:17-jdk-alpine

# Set working directory
WORKDIR /app

# Copy Maven wrapper & pom
COPY .mvn/ .mvn
COPY mvnw .
COPY mvnw.cmd .
COPY pom.xml .

# Download dependencies (cache layer)
RUN ./mvnw dependency:go-offline

# Copy source code
COPY src ./src

# Build Spring Boot jar
RUN ./mvnw clean package -DskipTests

# Expose port (Spring Boot runs on 8080)
EXPOSE 8080

# Run the jar
CMD ["java", "-jar", "target/demo-0.0.1-SNAPSHOT.jar"]
