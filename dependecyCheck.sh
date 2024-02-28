#!/bin/bash

clusterName=$(aws eks list-clusters | grep roboshop | xargs)

echo "update cluster config"
aws eks update-kubeconfig --name $clusterName --region us-east-1

ingressClass=$(kubectl get ingressclass | grep alb | awk '{print $1}')
nameSpace=$(kubectl get ns | grep roboshop | awk '{print $1}')

if [ $ingressClass == 'alb' ]; then
    echo "AWS LBC Installed"
else 
    echo "AWS LBC not Installed"
    exit 1
fi

if [ $ingressClass != 'roboshop' ]; then
    kubectl create namespace roboshop
    echo "Roboshop namesapce created"
else 
    echo "Roboshop namesapce found"
fi