# Setting up in a bare metal.
https://blog.alexellis.io/kubernetes-in-10-minutes/

# Dashboard UI.
https://github.com/kubernetes/dashboard

# Creating a user.
https://github.com/kubernetes/dashboard/wiki/Creating-sample-user

# Setting up heapster
https://github.com/kubernetes/heapster/tree/master/deploy/kube-config/influxdb

# For the heapster to work
https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/rbac/heapster-rbac.yaml

kubectl taint nodes --all node-role.kubernetes.io/master-

# Genereate the token
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')