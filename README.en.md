
<a href="README.md">
  <img
    align="right"
    src="https://img.shields.io/badge/Español-5291f5?style=for-the-badge&logoColor=white&logo=googletranslate"
    alt="Español"
  />
</a>

# Wordpress and MySQL 🐬
### Application with the following features:
- Namespace for Wordpress and MySQL
- Persistent volume for the database
- Port Forwarding for accessing Wordpress from local host
- ConfigMap and Secrets

### Previous requirements 📝
- Kubernetes 🐳
- Minikube ⚙

## Run the project 🚀
```bash
$ bash deployment.sh
```
### Options menu 📋
```bash
==============================
Wordpress and MySQL deployment
==============================
1) Deploy all services 🚀
2) Delete all services 🙃
3) Turn on website 🌐
4) Quit 👋
Select an option and press Enter 👆: 
```

### Demo 🎬
<img height="500" src="./demo/demo.gif"/>

## Project structure 📂
```bash
.
├── database/
│   ├── deployment.sh
│   ├── namespace.yml
│   ├── config-map.yml
│   ├── secret.yml
│   ├── storage-class.yml
│   ├── pv-claim.yml
│   ├── persistent-volume.yml
│   ├── service.yml
│   └── deployment.yml
├── deployment.sh
├── namespace.yml
├── config-map.yml
├── secret.yml
├── service.yml
├── deployment.yml
└── README.md
```
