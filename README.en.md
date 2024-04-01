
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
- [**Microk8s**](https://microk8s.io/docs/getting-started)
- Run bash from the **root** folder of the project
- Addons [**hostpath-storage**](https://microk8s.io/docs/addon-hostpath-storage)

#### Enabled port
- [**31000**](http://localhost:31000)

### Options menu 📋
```bash
$ bash deployment.sh
```
```bash
=========================
 Portafolio deployment 💼
=========================
1) Deploy service 🚀
2) Delete service 🗑️
3) Port forward website 🌐
5) Quit 👋
Select an option and press Enter 👆: 
```

### Demo 🎬
<img width="500" src="./demo/demo.gif"/>


## Relevant information 📑
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
