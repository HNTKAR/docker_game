#!/usr/bin/bash
cd /mc
curl -O https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar 
echo 'eula=true'>eula.txt
java -Xmx2048M -Xms2048M -jar server.jar
