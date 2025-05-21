# Build stage
FROM node:18-alpine AS build

WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy source code
COPY . .

# Build the application
RUN npm run build

# Production stage
FROM node:18-alpine AS production

WORKDIR /app

# Install serve for static file serving
RUN npm install -g serve

# Copy built application from build stage
COPY --from=build /app/out ./out

# Set environment variables
ENV NODE_ENV=production

# Expose the port
EXPOSE 3000

# Start the application with serve
CMD ["serve", "-s", "out", "-p", "3000"]
