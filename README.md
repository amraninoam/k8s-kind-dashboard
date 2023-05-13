# k8s-kind-dashboard
## Overview
This repo installs a kubernetes cluster on your environment using kind with:  
- [Nginx Ingress Controller](https://github.com/kubernetes/ingress-nginx/tree/main/charts/ingress-nginx)  
- [Kubernetes Dashboard](https://github.com/kubernetes/dashboard) (with users).  
- [Metric Server](https://github.com/kubernetes-sigs/metrics-server) with insecure flag (due to kind).  
## Requirements
This repo assumes you have
- [Kubernetes Kind](https://kind.sigs.k8s.io/) installed on a linux environment (bash is used)
- [yq](https://github.com/mikefarah/yq) to perform some yaml replacements.  


## How to
Start with  
```
cd scripts
./create cluster.sh
```

It will create a kind cluster for you with nginx ingress controller.    
The ingress controller will listen on port 80/443 and will redirect you to the dashboard on http://localhost.  
The script will also create two users: admin-user and readonly-user and will provide password for each.  

To finish 
```
./delete cluster.sh
```