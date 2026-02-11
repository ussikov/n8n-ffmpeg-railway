# Extend the official n8n image with ffmpeg support
FROM n8nio/n8n:latest

# Switch to root to install system packages
USER root

# Try apk first (for Alpine-based images), fallback to apt if needed
RUN apk add --no-cache ffmpeg 2>/dev/null || \
    (apt-get update && apt-get install -y ffmpeg && apt-get clean && rm -rf /var/lib/apt/lists/*) || \
        true

        # Switch back to node user
        USER node

        # Keep the original n8n entrypoint and CMD
