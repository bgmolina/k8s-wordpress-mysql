#!/bin/bash

echo "=============================="
echo "Wordpress and MySQL deployment"
echo "=============================="

PS3="Select an option and press Enter 👆: "
OPTIONS=("Deploy all services 🚀" "Delete all services 🙃" "Quit 👋")

: '
OPTIONS index:
1 -> Deploy all services 🚀
2 -> Delete all services 🙃
3 -> Quit 👋
'

while true; do
    select opt in "${OPTIONS[@]}" ; do
        case $REPLY in
            "1")
                ARGS="apply"
                echo "[wordpress] Deploying services...🚀"
                bash database/deployment.sh

                kubectl $ARGS -f service.yml
                kubectl $ARGS -f deployment.yml

                echo ""
                echo "App running at 🌐:"
                echo "- Local:   http://localhost:3000/"
                echo "- Network: http://127.0.0.1:3000/"
                echo ""
                echo "Checking if pods is ready 👀 and running port-forward...🔎"
                # check if pod with label app=wordpress is ready when deploying and
                # forward port 3000 to 80 (server) for testing purposes only (not for production)
                # wait for 60 seconds.
                kubectl wait --for=condition=ready pod -l app=wordpress --timeout=60s && 
                # kubectl port-forward service/ingress-nginx-controller -n ingress-nginx 3000:80
                kubectl port-forward service/wordpress-svc 3000:80

                exit 0
                ;;
            "2")
                ARGS="delete"
                echo "[wordpress] Removing services...🙃"
                bash database/deployment.sh $ARGS
                kubectl $ARGS -f deployment.yml
                kubectl $ARGS -f service.yml

                exit 0
                ;;
            "3")
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
