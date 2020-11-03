#!/usr/bin/bash
cd /mc
curl -O https://launcher.mojang.com/v1/objects/35139deedbd5182953cf1caa23835da59ca3d7cd/server.jar 
echo 'eula=true'>eula.txt
java -Xmx2048M -Xms2048M -jar server.jar
