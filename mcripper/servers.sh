#!/bin/bash
rm minecraftjsons 2>/dev/null

#Get a list of urls from mojang
echo "Curling version_manifest.json....."
curl -s https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r '.versions | .[] | .url' >> minecraftjsons
length=$(cat minecraftjsons | wc -l)

#While loop to download everything
for (( c=1; c<=length; c++ ))
do
   jsonurl=$(sed "${c}q;d" minecraftjsons)
   jarurl=$(curl -s "${jsonurl}" | jq -r '.downloads.server.url')
   jarver=$(curl -s "${jsonurl}" | jq -r '.id')
   if [[ "${jarver}" == "1.2.4" ]]; then
   	exit
   fi
   echo "Getting ${jarver} at ${jarurl}"
   wget -nc -O "${jarver}.jar" "${jarurl}" 
done

rm minecraftjsons
