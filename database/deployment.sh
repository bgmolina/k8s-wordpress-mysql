#!/bin/bash
# conditional to check if argument is "delete" or no argument is given
if [ "$*" != "delete" ] && [ "$*" != "apply" ]; then
  echo "Invalid argument 🚫: [$*], [delete] or [apply] is allowed"
  exit 1
fi

# store arguments sended in variable
ARGS="$*"

if [ "$ARGS" == "delete" ]; then
  echo "[database] Removing services...🙃"
  microk8s kubectl $ARGS -f database/deployment.yml
  microk8s kubectl $ARGS -f database/service.yml
  microk8s kubectl $ARGS -f database/config-map.yml
  microk8s kubectl $ARGS -f database/secret.yml
else
  NAMESPACE="database"
  echo "[database] Deploying services...🚀"
  if ! microk8s kubectl get namespace "$NAMESPACE" &>/dev/null; then
    microk8s kubectl $ARGS -f database/namespace.yml
  fi
  microk8s kubectl $ARGS -f database/config-map.yml
  microk8s kubectl $ARGS -f database/secret.yml
  microk8s kubectl $ARGS -f database/pv-claim.yml
  microk8s kubectl $ARGS -f database/service.yml
  microk8s kubectl $ARGS -f database/deployment.yml
fi
