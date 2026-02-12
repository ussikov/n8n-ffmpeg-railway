FROM alpine:3.22 AS ffmpeg-stage
RUN apk add --no-cache ffmpeg

FROM n8nio/n8n:latest

USER root

# Copy ffmpeg binaries and all required shared libraries from Alpine
COPY --from=ffmpeg-stage /usr/bin/ffmpeg /usr/bin/ffmpeg
COPY --from=ffmpeg-stage /usr/bin/ffprobe /usr/bin/ffprobe
COPY --from=ffmpeg-stage /usr/lib/ /usr/lib/

# Verify ffmpeg is working
RUN ffmpeg -version

USER node
