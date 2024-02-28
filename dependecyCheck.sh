#!/bin/bash

echo "update cluster config"
aws eks update-kubeconfig --name roboshop-eks-cluster-demo --region us-east-1

ingressClass=$(kubectl get ingressclass | grep alb | awk '{print $1}')

if [ $ingressClass == 'albc' ]; then
    echo "AWS LBC Installed"
else 
    echo "AWS LBC not Installed"
    exit 1
fi