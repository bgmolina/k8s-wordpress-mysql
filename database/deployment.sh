#!/bin/bash
# conditional to check if argument is "delete" or no argument is given
if [ "$*" != "delete" ] && [ "$*" != "apply" ]; then
    echo "Invalid argument 🚫: [$*], [delete] or [apply] is allowed"
    exit 1 # exit with error code 1
fi

# store arguments sended in variable
ARGS="$*"

if [ "$ARGS" == "delete" ]; then
    echo "[database] Removing services...🙃"
    kubectl $ARGS -f database/deployment.yml
    kubectl $ARGS -f database/service.yml
    kubectl $ARGS -f database/config-map.yml
    kubectl $ARGS -f database/secret.yml
    kubectl $ARGS -f database/pv-claim.yml
    kubectl $ARGS -f database/persistent-volume.yml
    kubectl $ARGS -f database/storage-class.yaml
    kubectl label nodes minikube disktype- # remove label for minikube node
else
    echo "[database] 🗃 Deploying services...🚀"
    kubectl label nodes minikube disktype=local # create label for minikube node
    minikube ssh "sudo mkdir /mnt/data" # create directory for minikube to mount the volume to the node

    kubectl $ARGS -f database/config-map.yml
    kubectl $ARGS -f database/secret.yml
    kubectl $ARGS -f database/storage-class.yaml
    kubectl $ARGS -f database/pv-claim.yml
    kubectl $ARGS -f database/persistent-volume.yml
    kubectl $ARGS -f database/service.yml
    kubectl $ARGS -f database/deployment.yml
fi
