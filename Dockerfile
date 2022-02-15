FROM node:17-buster

COPY . /app
WORKDIR /app
RUN chmod -R 775 /app/scripts/*.txt && chmod +x /app/scripts/* &&\
    apt update && DEBIAN_FRONTEND=noninteractive apt install mtr geoip-bin geoip-database geoip-database-extra -y

ENTRYPOINT [ "/app/scripts/entrypoint.sh", "/app/scripts" ]