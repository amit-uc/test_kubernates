## DNS AS service Discovery in Kubernetes

- Every Service in your kubernetes Cluster gets a DNS name

- Kubernetes has a specific  & consistent nomenclature for deciding what this DNS name is
  - <my-service-name>.<my-namespace>.svc.cluster.local
  
 
 Here we create two deployments which we will be linking together so that they can communicate together.
 
 - We will deploy MySQL in a deployment named "wordpress-mysql"
 - Once deployed, it will run MySQL 5.6 on port 3306 on the wordpress-mysql hostname
  
 - mysql-wordpress
   - We will deploy WordPress named as "wordpress"
   - We will configure MySQL to be available on the "wordpress-mysql" hostname and tell wordpress to expect it there.
   
   
   
- If you donot mention the type then the service is only available inside the kubernetes cluster.
- Where as if you define it as LoadBalancer it is accessable outside the kubernetes cluster too.

## In minikube there is no LoadBalancer (LoadBalancer IP is actually assigned by the Service provider. E.g. AWS)

 