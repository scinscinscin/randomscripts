#!/bin/bash
while :
do 
echo "Select which version you want to install, Only works 1.3+. Ex: 1.8"	
read -r version

json0=$(curl -s https://launchermeta.mojang.com/mc/game/version_manifest.json | jq  -r --arg version "$version" '.versions[] | select(.id==$version)' | grep url | awk '{ print $2 }')
if [[ "${json0}" == "" ]] || [[ "${json0}" == "null" ]]; then 
	echo "This version is invalid, Please try again."
else
    json1=${json0//,}
    temp="${json1%\"}"
    temp="${temp#\"}"
    dllink=$(curl -s "${temp}" | jq .downloads.server.url)
    if [[ "${dllink}" == "null" ]]; then
        echo "This version is invalid, Please try again."
    else
	echo "Will be installing ${version}from ${dllink}"
	break
    fi
fi
done
