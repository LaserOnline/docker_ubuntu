
$container = "ubuntu-dev-test"

docker stop $container

docker rm --force $container
docker rmi --force $container

# docker builder prune -y