FROM alpine:3.18
RUN apk add --no-cache ffmpeg
WORKDIR /app
COPY image.jpg audio.mp3 ./
CMD ffmpeg -loop 1 -i image.jpg -stream_loop -1 -i audio.mp3 -c:v libx264 -tune stillimage -pix_fmt yuv420p -b:v 1000k -c:a aac -b:a 128k -f flv "$STREAM_URL/$STREAM_KEY"
