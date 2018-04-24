
``` bash
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```
 
``` bash
apt-get update

apt-get install docker-ce
```
  
[Install Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce-1)

```bash
sudo apt-get update \
  && sudo apt-get install -y apt-transport-https \
  && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
```
```bash
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" \
  | sudo tee -a /etc/apt/sources.list.d/kubernetes.list \
  && sudo apt-get update
```

```bash
sudo apt-get update \
  && sudo apt-get install -y \
  kubelet \
  kubeadm \
  kubernetes-cni
```

```bash
kubeadm init
```

After the master has been created and if we list the nodes  
```bash
kubectl get nodes
```
```bash
ubuntu@ip-192-168-30-52:~$ kubectl get nodes
NAME              STATUS     ROLES     AGE       VERSION
ip-192-168-30-52   NotReady   master    40s       v1.10.1

```
The status of the node is NotReady. The reason for this is because kube-dns is pending. The NotReady will disapear after a CNI network is intalled.

```bash

ubuntu@ip-192-168-30-52:~$ kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
```

[Reference To setup](https://www.cloudtechnologyexperts.com/kubeadm-on-aws/)