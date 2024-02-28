#!/bin/bash

# Exit immediately if a command exits with a non-zero status. This ensures that the script stops executing if any command fails.
# Treat unset variables as an error when expanding them. This means if you try to use a variable that hasn't been set, it will throw an error.
set -eu
# Setting pipefail ensures that a pipeline returns a non-zero status if any command within it fails.
# Rather than returning the exit status of the last command in the pipeline. 
# This is particularly useful for error handling in shell scripts. 
set -o pipefail

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

if [ $nameSpace != 'roboshop' ]; then
    kubectl create namespace roboshop
    echo "Roboshop namesapce created"
else 
    echo "Roboshop namesapce found, pipeline will be continued."
fi

exit 1