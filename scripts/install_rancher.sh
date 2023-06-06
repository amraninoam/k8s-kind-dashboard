#!/bin/bash

./install_cert_manager.sh

#Update helm
helm repo add rancher-stable https://releases.rancher.com/server-charts/stable
helm repo update

#Create ns if required
kubectl create namespace cattle-system --dry-run=client -o yaml | kubectl apply -f -
#Install dashboard
helm upgrade -i rancher rancher-stable/rancher -n cattle-system -f ../configurations/rancher/values.yaml

kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{.data.bootstrapPassword|base64decode}}{{"\n"}}'