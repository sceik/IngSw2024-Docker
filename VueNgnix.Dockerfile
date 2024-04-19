# Step 1: Build stage
# Use an official Node image as a parent image for building the React app
FROM node:20 as build

# Set the working directory
WORKDIR /app

# Copy the application code
COPY . .

# Install dependencies
RUN npm install

# Build the application
RUN npm run build

# Step 2: Serve stage
# Use the NGINX HTTP Server image to serve the static files
FROM nginx:stable

# Copy the build output from the build stage to the Apache server directory
COPY --from=build /app/dist/ /usr/share/nginx/html

# Configure Ngin Proxy
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 to the host
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
