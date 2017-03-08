FROM nginx:1.10.3-alpine

RUN mkdir -p /etc/nginx/servers
COPY nginx.conf gzip.conf ssl.conf proxy.conf mime.types /etc/nginx/
