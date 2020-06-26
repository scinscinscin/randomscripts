#!/bin/bash
rm minecraftjsons 2>/dev/null
rm links 2>/dev/null

#Get a list of urls from mojang
echo "Curling version_manifest.json....."
curl -s https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r '.versions | .[] | .url' >> minecraftjsons
length=$(cat minecraftjsons | wc -l)

#While loop to download everything
for (( c=1; c<=length; c++ ))
do
   jsonurl=$(sed "${c}q;d" minecraftjsons)
   jarurl=$(curl -s ${jsonurl} | jq -r | grep https | awk '{ print $2 }' | tr -d '"' >> links)
   jarver=$(curl -s "${jsonurl}" | jq -r '.id')
   mkdir ${jarver}
   echo "Getting ${jarver} files"
   wget -nc -i links -P "./${jarver}/" ${jarurl}
   echo "Successfully downloaded ${jarver} files"
   rm links
done

rm minecraftjsons
