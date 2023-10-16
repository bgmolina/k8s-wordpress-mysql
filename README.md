
<a href="README.en.md">
  <img
    align="right"
    src="https://img.shields.io/badge/English-5291f5?style=for-the-badge&logoColor=white&logo=googletranslate"
    alt="English"
  />
</a>

<div>
  <a href="https://minikube.sigs.k8s.io/docs/" target="_blank">
    <img
      src="https://img.shields.io/badge/v1.31.2-gray?style=flat&logo=minikube&label=Minikube&labelColor=161b22"
      alt="Minikube"
    />
  </a>
  <a href="https://kubernetes.io/" target="_blank">
    <img
      src="https://img.shields.io/badge/-v1.28.2-gray?style=flat&logo=kubernetes&label=Kubernetes&labelColor=161b22"
      alt="Kubernetes"
    />
  </a>
</div>

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
<!-- <img width="800" height="452" src="./demo/demo.gif"/> -->

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
- [ ] Grabar demo app
- [ ] Generar readme en ingles
-->
