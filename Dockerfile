FROM alpine:3.5

ADD rtorrent.rc /app/
ADD entrypoint.sh /app/

ENV TERM=xterm

# Download and install rtorrent
RUN mkdir -p /app /data/torrents /data/watch /data/complete /data/.session && \
    apk --no-cache --no-progress add ca-certificates rtorrent && \
    chmod +x /app/entrypoint.sh && \

EXPOSE 5000

VOLUME [/data/torrents, /data/complete, /data/watch]

WORKDIR /app

ENTRYPOINT ["/app/entrypoint.sh"]

CMD ["rtorrent", "-n", "-o", "import=/app/rtorrent.rc"]
