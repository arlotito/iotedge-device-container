# iotedge-device-container
An IoT Edge instance in a container.
It includes the IoT Edge runtime and a container engine (moby).

![text](./doc/images/diagram.png)

This work is based on this [repo](https://github.com/toolboc/azure-iot-edge-device-container) with the following changes:
* x86 only
* no self-provisioning, manual provisioning only via connection string in a .env file
* not tied to a specific version of iot edge runtime, it will use the lastest

For further info, have a look to Microsoft documentation [here](https://docs.microsoft.com/en-us/azure/iot-edge/development-environment#iot-edge-device-container).

## build
```
build-container.sh <docker-host> <image>
```
where:
* `<docker-host>` is the docker host you want to use to build the image (ex. 127.0.0.1 or any other)
* `<image>` is the image tag (ex. repo/image:tag)

example:
```
build-container.sh 192.168.2.96 arturol76/iotedgec
```

## run
```
build-container.sh <docker-host> <image>
```
where:
* `<docker-host>` is the docker host you want to run the container on (ex. 127.0.0.1 or any other)
* `<image>` is the image tag (ex. repo/image:tag)
It will create and run a container with id = 'iotedgec'

example:
```
run-container.sh 192.168.2.96 arturol76/iotedgec
```


## iotedge cli
```
exec-bash.sh <docker-host>
```
where:
* `<docker-host>` is the docker host where the 'iotedgec' container is running (ex. 127.0.0.1 or any other)

example:
```
exec-bash.sh 192.168.2.96
```

## .env file
Create an .env file with the iot hub connection string as follows:
```
DEVICE_CONNECTION_STRING=HostName=xyz.azure-devices.net;DeviceId=xxx;SharedAccessKey=xxxxxxxxyyyyyyyyyyyyyzzzzzzzzz
```
Save the file in the same folder as the 'run-container.sh' file.
