#!/bin/bash
echo "Checking ports..."
./check_ports.sh && echo "check succeeded" || { exit 1; }

echo "Installing cluster..."
kind create cluster --name sdp --config ../cluster/sdp.yaml

echo "Installing nginx ingress controller..."
./install_ingress_controller.sh

echo "Waiting for ingress controller to be ready (up to 3m)..."
kubectl wait --namespace ingress-nginx --for=condition=ready pod -l app.kubernetes.io/component=controller,app.kubernetes.io/instance=ingress-nginx,app.kubernetes.io/name=ingress-nginx --timeout=180s

echo "Installing dashboard..."
./install_dashboard.sh

echo "Installing Metrics Server"
./install_metrics_server.sh
