#!/bin/bash

torchx list -s kubernetes 

echo ""

kubectl get vcjob -o wide

