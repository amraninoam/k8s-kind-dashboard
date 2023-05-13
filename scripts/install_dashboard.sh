#!/bin/bash

#Update helm
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm repo update

#Create ns if required
kubectl create namespace dashboard --dry-run=client -o yaml | kubectl apply -f -
#Install dashboard
helm upgrade -i dashboard kubernetes-dashboard/kubernetes-dashboard -n dashboard -f ../configurations/dashboard/values.yaml
#Apply Admin and ReadOnly users
kubectl apply -f ../configurations/dashboard/users.yaml
#Echo passwords
echo "Admin user: $(kubectl -n dashboard get secret $(kubectl -n dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode)"
echo "ReadOnly: $(kubectl -n dashboard get secret $(kubectl -n dashboard get sa/readonly-user -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode)"