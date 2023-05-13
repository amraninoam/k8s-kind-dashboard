#!/bin/bash
#Update helm
helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
helm repo update

#Install dashboard
helm upgrade -i metrics-server metrics-server/metrics-server -n kube-system
helm upgrade metrics-server metrics-server/metrics-server --set args="{--kubelet-insecure-tls}" -n kube-system

