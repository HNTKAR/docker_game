#!/usr/bin/bash
cd /mc
curl -O https://launcher.mojang.com/v1/objects/f02f4473dbf152c23d7d484952121db0b36698cb/server.jar
echo 'eula=true'>eula.txt
java -Xmx2048M -Xms2048M -jar server.jar
