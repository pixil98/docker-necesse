#!/bin/bash

mkdir -p ~/.config
ln -s /config/ ~/.config/Necesse

/necesse/jre/bin/java -jar /necesse/Server.jar -nogui -world "${WORLD_NAME}"