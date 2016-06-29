FROM nginx:1.10.0-alpine

# Generate strong DH parameters for nginx
RUN mkdir -p /etc/ssl/private
RUN chmod 710 /etc/ssl/private
RUN openssl dhparam -out /etc/ssl/private/dhparams.pem 2048
RUN chmod 600 /etc/ssl/private/dhparams.pem

RUN mkdir -p /etc/nginx/servers
COPY nginx.conf gzip.conf ssl.conf proxy.conf mime.types /etc/nginx/
COPY server.conf /etc/nginx/servers/default.conf

USER nginx
