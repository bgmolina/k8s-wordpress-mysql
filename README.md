
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
- [**Microk8s**](https://microk8s.io/docs/getting-started)
- Ejecutar bash desde carpeta **root** del proyecto
- Addons [**hostpath-storage**](https://microk8s.io/docs/addon-hostpath-storage)

#### Puerto habilitado
- [**31000**](http://localhost:31000)

### Menu de opciones 📋
```bash
$ bash deployment.sh
```
```bash
=======================
 Wordpress and MySQL 🐬
=======================
1) Deploy all services 🚀
2) Delete all services 🗑️
3) Port forward website 🌐
5) Quit 👋
Select an option and press Enter 👆: 
```

### Demo 🎬
<img width="500" src="./demo/demo.gif"/>

## Información relevante 📑
### Deployment
```bash
$ kubectl get deployment --all-namespaces -l app=wordpress
```
| NAMESPACE  | NAME      | IMAGES                 |
| ---------- | --------- | ---------------------- |
| database   | mysql     | mysql:8.1.0            |
| web        | wordpress | wordpress:6.2.1-apache |

### Service
```bash
$ kubectl get services --all-namespaces -l app=wordpress
```
| NAMESPACE  | NAME          | TYPE      | PORT(S)      |
| ---------- | ------------- | --------- | ------------ |
| database   | mysql-svc     | ClusterIP | 3306/TCP     |
| web        | wordpress-svc | NodePort  | 80:31000/TCP |

### Persistent Volume Claim
```bash
$ kubectl get pvc -n database
```
| NAME       | CAPACITY  | ACCESS MODES  | STORAGECLASS      |
| ---------- | --------- | ------------- | ----------------- |
| mysql-pvc  | 4Gi       | RWO           | microk8s-hostpath |
