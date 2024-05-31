# Use the official Node.js image as the base image
FROM node:20.13.1-alpine3.20

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the Vite application for production
RUN npm run build

# Install a simple web server to serve the static files
RUN npm install -g serve

# Expose the port the app runs on
EXPOSE 4173

# Command to run the application
CMD ["serve", "-s", "dist", "-l", "4173"]
