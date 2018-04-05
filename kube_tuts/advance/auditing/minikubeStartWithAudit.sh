#!/bin/sh
minikube start  --extra-config=apiserver.Authorization.Mode=RBAC --extra-config=apiserver.Audit.LogOptions.Path=/var/logs/audit.log   --extra-config=apiserver.Audit.PolicyFile=/etc/kubernetes/addons/audit-policy.yml

kubeadm join 192.168.1.61:6443 --token 73ysr0.ohtkw6s4kzfaope1 --discovery-token-ca-cert-hash sha256:34e4900a490e0afb855ab7a56f6c2d1f73b2e923749428b1ae5f969ca3cc1287
