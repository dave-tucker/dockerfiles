FROM alpine:3.4
RUN apk add --no-cache transmission-daemon

EXPOSE 9091
EXPOSE 51413
CMD ["/usr/bin/transmission-daemon", "-f", "-g", "/transmission"]
