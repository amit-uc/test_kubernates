
## Command to create the web dashboard
- kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/
kubernetes-dashboard.yaml 

Accessing the dashboard (the most fool-proof way)
- kubectl proxy

- kubectl proxy
- kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
- <a href="http://localhost:8001/api/v1/namespaces/kube-system/services/kubernetes-dashboard/proxy/#!/">Open The Dashboard</a>