FROM debian:stable-slim

RUN apt-get update && apt-get install -y icecast2 && \
    useradd -m icecast

RUN mkdir -p /var/log/icecast2 && chown -R icecast:icecast /var/log/icecast2

COPY icecast.xml /etc/icecast2/icecast.xml

USER icecast

EXPOSE 8000

CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]
