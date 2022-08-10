FROM debian:bullseye-slim

ARG FOLDER_NAME

RUN mkdir /config

COPY ${FOLDER_NAME} /necesse
COPY start-necesse.sh .

ENV WORLD_NAME="myworld"

CMD ["./start-necesse.sh"]

EXPOSE 14159/udp