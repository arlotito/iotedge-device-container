#example
#   build-container.sh 192.168.2.96 arturol76/iotedgec
DOCKER_HOST=$1
IMAGE_TAG=$2

docker -H $DOCKER_HOST build -t $IMAGE_TAG ./docker