while :
do 
    read -r version
    if [[ ${version} == "" ]]; then version="latest"; fi
    if curl -s -o /dev/null -w "%{http_code}" curl https://hub.spigotmc.org/versions/${version}.json | grep 200 >> /dev/null ; then
        echo "${version} is a valid version, Proceeding."
	break
    else 
        echo "${version} is not a Spigot version, Please try again."
    fi
done
