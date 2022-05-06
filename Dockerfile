FROM debian:bullseye-slim

ARG FOLDER_NAME

RUN mkdir /config

COPY .build/server/${FOLDER_NAME} /necesse
COPY start-necesse.sh .

ENV WORLD_NAME="myworld.zip"

CMD ["./start-necesse.sh"]

EXPOSE 14159/udp