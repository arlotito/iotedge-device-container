# attach-bash <docker-host>
#
# example:
#   attach-bash 192.168.2.96
#   attach-bash 127.0.0.1
DOCKER_HOST=$1

docker -H $DOCKER_HOST exec -it iotedgec bash