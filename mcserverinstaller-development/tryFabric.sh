while :
do
    read -r version
    json0=$(curl -s https://launchermeta.mojang.com/mc/game/version_manifest.json | jq  -r --arg version "$version" '.versions[] | select(.id==$version)' | grep releaseTime | awk '{print $2}' )
    echo "${json0}"
    json0="${json0%\"}"
    json0="${json0#\"}"
    json0="$(echo ${json0:0:10})"
    echo "${json0}"
    if [[ "${json0}" == "" ]]; then
	echo "This is invalid, Please try again."	
    elif [[ "${json0}" <  "2018-10-23" ]] || [ "${version}" == "18w43a" ]; then
        echo "This version is not supported by Fabric, Please try again."
    else
        echo "This is valid"
        break
    fi
done
echo "Script is finished"
