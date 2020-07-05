echo "What version of Paper would you like to install?"
while :
do
    read -r version
    if [[ ${version} == "1.12" ]]; then
        wget https://papermc.io/ci/job/Paper/lastSuccessfulBuild/artifact/paperclip.jar
    elif curl -s -o /dev/null -w "%{http_code}" curl https://papermc.io/ci/job/Paper-${version}/lastSuccessfulBuild/artifact/paperclip.jar | sed '/Jetty/d' | grep 200 >> /dev/null ; then
    	echo "${version} is a valid version"
	break
    else 	
        echo "${head}${version}${body} is not a Paper version, Please try again.${NC}"
    fi
done 
echo "Script is finished"
