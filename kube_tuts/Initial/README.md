MASTERING KUBERNETES
## Start minikube
- $ minikube start
## Deploy a sample Kubernetes “deployment” to your local minikube
- $ kubectl run hello-minikube --image=gcr.io/google_containers/echoserver:1.4 --port=8080
## Expose this deployment to an external network
- $ kubectl expose deployment hello-minikube --type=NodePort
## List the “pods” of this deployment
- $ kubectl get pod
## Access the sample service
- $ curl $(minikube service hello-minikube --url)
## Delete the deployment
- $ kubectl delete deployment hello-minikube
## Stop minikube
- $ minikube stop
