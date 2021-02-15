FROM alpine:3.10
LABEL maintainer="Joaquin Trillo"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]