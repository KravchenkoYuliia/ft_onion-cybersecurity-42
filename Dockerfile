FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
      nginx openssh-server tor \
    && rm -rf /var/lib/apt/lists/*
RUN useradd -m -s /bin/bash yukravch \
 && mkdir -p /run/sshd /var/lib/tor/hidden_service \
 && ssh-keygen -A
COPY index.html /var/www/html/index.html
COPY nginx.conf /etc/nginx/nginx.conf
COPY sshd_config /etc/ssh/sshd_config
COPY torrc /etc/tor/torrc
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]