# Use official Node.js Alpine as base image with ffmpeg support
FROM node:18-alpine

# Install ffmpeg and dependencies
RUN apk add --no-cache ffmpeg

# Install n8n globally
RUN npm install -g n8n

# Create app directory
WORKDIR /home/node/app

# Expose default n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n"]
