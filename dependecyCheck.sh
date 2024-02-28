#!/bin/bash

echo "update cluster config"
aws eks update-kubeconfig --name roboshop-eks-cluster-demo --region us-east-1

ingressClass=$(kubectl get ingressclass | grep alb | awk '{print $1}')

if [ $ingressClass == 'alb' ]; then
    echo "AWS LBC Installed"
    continue 
else 
    exit 1
fi