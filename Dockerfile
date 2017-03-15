FROM alpine:3.5

ADD rtorrent.rc /app/

ENV TERM=xterm

# Download and install rtorrent
RUN mkdir -p /app /data/torrents /data/complete /data/.session && \
    apk --no-cache --no-progress add ca-certificates rtorrent

EXPOSE 5000

VOLUME [/data/torrents, /data/complete, /data/.session]

WORKDIR /app

CMD ["rtorrent", "-n", "-o", "import=/app/rtorrent.rc"]
