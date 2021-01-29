FROM ubuntu:xenial

RUN apt-get update && apt-get install -yq --allow-unauthenticated\
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common && python && add-apt-repository ppa:certbot/certbot -y && apt-get update && apt-get install certbot -yq --allow-unauthenticated
#RUN mkdir /etc/letsencrypt
RUN add-apt-repository ppa:jonathonf/python-3.6 && apt-get update && apt-get install python3.6

CMD ["/entrypoint.sh"]

COPY secret-patch-template.json /
COPY deployment-patch-template.json /
COPY entrypoint.sh /
