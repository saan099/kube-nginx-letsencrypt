FROM ubuntu:xenial

RUN apt-get update && apt-get install -yq --allow-unauthenticated\
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common && add-apt-repository ppa:certbot/certbot -y && apt-get update && apt-get install certbot -yq --allow-unauthenticated
#RUN mkdir /etc/letsencrypt

CMD ["/entrypoint.sh"]

COPY secret-patch-template.json /
COPY deployment-patch-template.json /
COPY entrypoint.sh /
