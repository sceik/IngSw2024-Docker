
# Docker and Docker Compose Workshop

This README provides instructions on how to run a MySQL container, build and run a backend service using Java/Spring Boot, and set up a frontend application with Vue.js. Additionally, it shows how to orchestrate these services using Docker Compose.

## Run MySQL Container

Start by running a MySQL container with Docker:

```bash
docker run --name mysql -e MYSQL_ROOT_PASSWORD=password -p 3306:3306 mysql:8.3
```

## Test MySQL Connection

To test if the MySQL container is running and accessible, use the following command:
```bash
mysql -h 127.0.0.1 -P 3306 -u root -p
```

Enter the password when prompted (in this case, `password`).

## Build Backend Java/Spring Boot

Build the Docker image for the backend application using:
```bash
docker build -t backend:latest -f Dockerfile .
```

## Run Backend Java/Spring Boot

Run the backend service, connecting it to the MySQL container:
```bash
docker run -p 8088:8080 -e SPRING_DATASOURCE_URL=jdbc:mysql://127.0.0.1:3306/prova -e SPRING_DATASOURCE_USERNAME=root -e SPRING_DATASOURCE_PASSWORD=password --network=host backend
```


## Build Frontend Vue.js

Build the Docker image for the Vue.js frontend:
```bash
docker build -t frontend:latest -f Dockerfile .
```

## Run Frontend Vue.js

Start the frontend application:
```bash
docker run -p 80:8081 frontend
```


## Run All Together with Docker Compose

To run the MySQL container, backend, and frontend together using Docker Compose:
```bash
docker compose up
```

Ensure you have a `docker-compose.yml` file configured correctly to manage the relationships and network settings between containers.
