# Step 1: Use the Gradle base image for building the application
FROM openjdk:21-jdk as build

# Step 2: Create app directory in container
WORKDIR /app

# Step 3: Copy the project files to the container
COPY . .

# Step 4: Build the application
RUN ./gradlew build -x test

# Step 5: Use OpenJDK image for the runtime
FROM openjdk:21-jdk-slim

# Step 6: Set the working directory in the container
WORKDIR /app

# Step 7: Copy the built jar file from the build stage
COPY --from=build /app/build/libs/MicroservizioBase-0.0.1-SNAPSHOT.jar.jar app.jar

# Step 8: Command to run the application
ENTRYPOINT ["java","-jar","app.jar"]
