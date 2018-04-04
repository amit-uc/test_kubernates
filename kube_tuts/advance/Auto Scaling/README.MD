What is the HORIZONTAL POD AUTOSCALER?

- The Horizontal Pod Autoscaler (HPA) is a Kubernetes facility that adjusts the number of replicas of a Pod to match observed average CPU utilization to a target specified by the user.
- There are a variety of configurable options - quite a few - the key takeaway is to know the HPA will create new Pods (or remove Pods) from a replica to maintain average CPU utilization across all Pods to a level specified when you create your HPA - subject to conditions you specify.

Creating a HPA
- kubectl autocalse provides the needed functions to create an HPA
- kubectl autoscale deploymenet wordpress --cpu-percent=50 --min=1 --max=10

Commands
- kubectl apply -f ./wordpress-deployment.yml
- kubectl autoscale deployment wordpress --cpu-percent=50 --min=1 --max=5
- kubectl run -i --tty load-generator --image=busybox /bin/sh
- while true; do wget -q -O- http://wordpress.default.svc.cluster.local; done

- kubectl get hpa