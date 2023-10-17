
<a href="README.en.md">
  <img
    align="right"
    src="https://img.shields.io/badge/English-5291f5?style=for-the-badge&logoColor=white&logo=googletranslate"
    alt="English"
  />
</a>

# Wordpress y MySQL 🐬
### Aplicación con las siguientes características:
- Namespace para Wordpress y MySQL
- Volumen persistente para la base de datos
- Port Forwarding para acceder a Wordpress desde el host local
- ConfigMap y Secretos

### Requisitos previos 📝
- Kubernetes 🐳
- Minikube ⚙

## Ejecución del proyecto 🚀
```bash
$ bash deployment.sh
```
### Menu de opciones 📋
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

## Estructura de proyecto 📂
```bash
.
├── database/
│   ├── deployment.sh
│   ├── namespace.yml
│   ├── config-map.yml
│   ├── secret.yml
│   └── storage-class.yml
│   ├── pv-claim.yml
│   ├── persistent-volume.yml
│   └── service.yml
│   ├── deployment.yml
├── deployment.sh
├── namespace.yml
├── config-map.yml
├── secret.yml
├── service.yml
├── deployment.yml
└── README.md
```


<!--
TODO:
- [x] Grabar demo app
- [ ] Generar readme en ingles
-->
