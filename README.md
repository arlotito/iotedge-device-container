# iotedge-device-container
An IoT Edge instance in a container.
It includes the IoT Edge runtime and a container engine (moby).

![text](./doc/images/diagram.png)

This work is based on this [repo](https://github.com/toolboc/azure-iot-edge-device-container) with the following changes:
* x86 only
* no self-provisioning, manual provisioning only via connection string via ENV
* not tied to a specific version of iot edge runtime, it will use the latest

For further info, have a look to Microsoft documentation [here](https://docs.microsoft.com/en-us/azure/iot-edge/development-environment#iot-edge-device-container).

## build
```
docker -H <docker-host> build -t <image> ./docker
```
where:
* `<docker-host>` is the docker host you want to use to build the image (ex. 127.0.0.1 or any other)
* `<image>` is the image tag (ex. repo/image:tag)

example:
```
docker -H 192.168.2.96 build -t arturol76/iotedgec ./docker
```

## run
```
docker -H <docker-host> run --privileged -e DEVICE_CONNECTION_STRING=<conn-string> --name iotedgec <image>
```
where:
* `<docker-host>` is the docker host you want to run the container on (ex. 127.0.0.1 or any other)
* `<conn-string>` is the IoT HUB device connection string 
* `<image>` is the image tag (ex. repo/image:tag)
It will create and run a container with id = 'iotedgec'

example:
```
docker -H 192.168.2.96 run --privileged -e DEVICE_CONNECTION_STRING=Host.... --name iotedgec arturol76/iotedgec
```


## iotedge cli
To access the iotedge CLI, open a bash: 
```
docker -H <docker-host> exec -it iotedgec bash
```
where:
* `<docker-host>` is the docker host where the 'iotedgec' container is running (ex. 127.0.0.1 or any other)
and use the CLI as you would normally do.

example:
```
docker -H 192.168.2.96 exec -it iotedgec bash
```
and then for instance:
```
iotedge list
```

## .env file
Create an .env file with the iot hub connection string as follows:
```
DEVICE_CONNECTION_STRING=HostName=xyz.azure-devices.net;DeviceId=xxx;SharedAccessKey=xxxxxxxxyyyyyyyyyyyyyzzzzzzzzz
```
Save the file in the same folder as the 'run-container.sh' file.
