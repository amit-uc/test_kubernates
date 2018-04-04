Useful commands for NAMESPACES

- kubectl create namespace <namespace name>
- kubectl get namespace



Exercise:
- kubectl create namespace cpu-limited-tomcat
- kubectl create -f ./cpu-limits.yml --namespace=cpu-limited-tomcat 
- kubectl apply -f ./tomcat-deployment.yml --namespace=cpu-limited-tomcat
- kubectl describe deployment tomcat-deployment --namespace=cpu-limited-tomcat


Commands
<pre>
kubectl create namespace <namespace name>
kubectl get namespace
kubectl create namespace cpu-limited-tomcat
kubectl create -f ./cpu-limits.yaml —namespace=cpu-limited-tomcat (from the GitHub repo directory for this lecture)
kubectl apply -f ./tomcat-deployment.yaml —namespace=cpu-limited-tomcat (from the GitHub repo directory for this lecture)
kubectl describe deployment tomcat-deployment —namespace=cpu-limited-tomcat
</pre> 