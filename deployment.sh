#!/bin/bash

echo "=============================="
echo "Wordpress and MySQL deployment"
echo "=============================="

PS3="Select an option and press Enter 👆: "
OPTIONS=("Deploy all services 🚀" "Delete all services 🗑️" "Port forward website 🌐" "Quit 👋")

: '
OPTIONS index:
1 -> Deploy all services 🚀
2 -> Delete all services 🗑️
3 -> Port forward website 🌐
4 -> Quit 👋
'

while true; do
  select opt in "${OPTIONS[@]}"; do
    case $REPLY in
    "1")
      ARGS="apply"
      NAMESPACE="web"
      echo ""
      bash database/deployment.sh $ARGS
      echo ""
      echo "[wordpress] Deploying services...🚀"
      if ! microk8s kubectl get namespace "$NAMESPACE" &>/dev/null; then
        microk8s kubectl $ARGS -f namespace.yml
      fi
      microk8s kubectl $ARGS -f config-map.yml
      microk8s kubectl $ARGS -f secret.yml
      microk8s kubectl $ARGS -f service.yml
      microk8s kubectl $ARGS -f deployment.yml

      ;;
    "2")
      ARGS="delete"
      echo ""
      bash database/deployment.sh $ARGS
      echo ""
      echo "[wordpress] Removing services...🙃"
      microk8s kubectl $ARGS -f deployment.yml
      microk8s kubectl $ARGS -f service.yml
      microk8s kubectl $ARGS -f config-map.yml
      microk8s kubectl $ARGS -f secret.yml

      ;;
    "3")
      NAMESPACE="web"
      echo ""
      echo "App running at 🌐:"
      echo "- Local:   http://localhost:3000/"
      echo "- Network: http://127.0.0.1:3000/"
      echo ""
      # check if pod with label app=wordpress and namespace=web is ready when deploying and
      # forward port 3000 to 80 (server) for testing purposes only (not for production)
      # wait for 60 seconds.
      microk8s kubectl wait --for=condition=ready -n "$NAMESPACE" pod -l app=wordpress --timeout=60s &&
      microk8s kubectl port-forward service/wordpress-svc 3000:80 -n "$NAMESPACE"

      ;;
    "4")
      echo "bye 👋"
      exit 0
      ;;
    *)
      echo ""
      echo "Invalid option 🙃, please try again 👇"
      ;;
    esac
    break
  done
done
