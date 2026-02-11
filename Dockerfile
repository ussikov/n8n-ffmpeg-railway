FROM n8nio/n8n:latest

# Switch to root for package installation
USER root

# Install ffmpeg using apk (for Alpine Linux)
RUN apk add --no-cache ffmpeg

# Switch back to node user for security
USER node

# Use default n8n entrypoint
CMD ["n8n"]
