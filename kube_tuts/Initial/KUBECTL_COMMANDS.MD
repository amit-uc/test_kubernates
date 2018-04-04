- kubectl expose deployment tomcat-deployment --type=NodePort
- kubectl describe pod test-app2-6bc6b544cc-pqqhl
- kubectl get pods
- kubectl get pods [pod name]
- kubectl expose <type name> <identifier/name> [—port=external port] [—target-port=container-port [—type=service-type]
  - There are various types of service type like (NodePort ..)
  - E.g. kubectl expose deployment sampleapp-deployment --type=NodePort
- kubectl port-forward <pod name> [LOCAL_PORT:]REMOTE_PORT]
  - This is used to port forward so the service is accessable from a remote cluster
  - E.g. kubectl port-forward test-app-23234kj34kj3434-3434n 80:5001
- kubectl attach <pod name> -c <container>
  - Allows you to attach to a process that is already running inside an existing container
  - E.g. kubectl attach test-app-23234kj34kj3434-3434n
- kubectl exec [-it] <pod name> [-c CONTAINER] — COMMAND [args…]
  - Execute a command within a container.
  - -i option will pass stdin to the container
  - -t option will specify stdin is a TTY.
  - E.g.kubectl exec -it test-app-23234kj34kj3434-3434n bash
- kubectl label [--overwrite] <type> KEY_1=VAL_1....
  - Updates the labels on a resource
  - E.g. kubectl label pods test-app2-6bc6b544cc-pqqhl healthy=false
- kubectl run <name> --image=image
  - Run a particular image on the cluster.
  - E.g. kubectl run hazelcast --image=hazelcast --port=5701


## These are the commands
- kubectl get pods
- kubectl describe pod test-app2-6bc6b544cc-pqqhl
- kubectl expose deployment sampleapp-deployment --type=NodePort
- 


## Scaling - A Practical Example
- kubectl scale --replicas=4 deployment/tomcat-deployment
  - Doing so scales the application without deleting the old one.


# Updating the service
- Previsouly we defined a NodePort
  - kubectl expose deployment test-app2 --type=NodePort
- Now, let's define a LoadBalancer service, instead
  - kubectl expose deployment test2-app --type=LoadBalancer --port=5001 --target-port=80 --name test2-app-load-balancer
  
 
- Finally let's see what ip address was assigned for the service.
  - kubectl describe services tomcat-load-balancer
