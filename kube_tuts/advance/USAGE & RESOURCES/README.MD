# heapster
- This is a tool that collects the metrics required to monitor the PODS
- By default certain cloud providers enable this
- But in minikube we will have to explicty start it

  - minikube addons enable heapster
  - kubectl get pods --namespace=kube-system
  - minikube addons open heapster