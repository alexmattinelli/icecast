FROM debian:stable-slim

RUN apt-get update && apt-get install -y icecast2 && \
    rm -rf /var/lib/apt/lists/*

# cria usuário não-root (OBRIGATÓRIO no Render)
RUN useradd -m -g icecast icecast || true && \
    mkdir -p /var/log/icecast && \
    chown -R icecast:icecast /var/log/icecast

COPY icecast.xml /etc/icecast2/icecast.xml

USER icecast

EXPOSE 8000

CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]
