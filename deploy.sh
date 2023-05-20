sh 'sudo docker login -u annith29 --password=${docker_password}'
sh 'sudo docker tag react-app:latest annith29/dev:react-app'
sh 'sudo docker push annith29/dev:react-app'
echo "image push at  dev dockerhub"
