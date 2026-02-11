FROM n8nio/n8n:latest

# Switch to root for package installation
USER root

# Install ffmpeg and keep the image clean
RUN apt-get update && \
    apt-get install -y \
            ffmpeg \
                && apt-get clean \
                    && rm -rf /var/lib/apt/lists/*

                    # Switch back to node user for security
                    USER node

                    # Use default n8n entrypoint
                    CMD ["n8n"]
