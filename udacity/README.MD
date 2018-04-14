
<pre>
    kubectl run nginx --image=nginx:1.10.0
    kubectl expose deployments nginx --port 80 --type LoadBalancer
    kubectl exec monolith --stdin --tty -c monolith /bin/sh
    kubectl logs <pod_name>
    kubectl logs -f <pod_name>
</pre>


Readiness Check:
- 

Liveness Probs:


"--------------------------"

- Kubernetes Config
  - Desired States
  - 
