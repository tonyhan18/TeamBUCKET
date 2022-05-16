#!/bin/bash

MAXCPU=20
MAXUNIT=8
kubectl delete -f 01.deploysvc.yaml
kubectl apply -f 01.deploysvc.yaml
kubectl delete hpa -n monitoring deploy-blog
kubectl delete hpa -n monitoring deploy-shop
kubectl delete hpa -n monitoring deploy-main
kubectl autoscale deploy -n monitoring deploy-blog --cpu-percent=$MAXCPU --min=1 --max=$MAXUNIT
kubectl autoscale deploy -n monitoring deploy-shop --cpu-percent=$MAXCPU --min=1 --max=$MAXUNIT
kubectl autoscale deploy -n monitoring deploy-main --cpu-percent=$MAXCPU --min=1 --max=$MAXUNIT
