FROM alpine:3.5

# Set environment
ENV RTORRENT_VER=0.9.6 \
    LIBTORRENT_VER=0.13.6

ENV TERM=xterm \
    HOME=/app \
    PWD=/app \
    RTORRENT_URL=https://github.com/rakshasa/rtorrent/archive/${RTORRENT_VER}.tar.gz \
    LIBTORRENT_URL=https://github.com/rakshasa/libtorrent/archive/${LIBTORRENT_VER}.tar.gz

ADD rtorrent.rc /app/

# Download and install rtorrent
RUN mkdir -p /app /data/torrents /data/complete /data/.session && \
    apk --no-cache --no-progress add ca-certificates rtorrent

EXPOSE 5000

WORKDIR /app

CMD ["rtorrent", "-n", "-o", "import=/app/rtorrent.rc"]
