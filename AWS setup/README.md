
# Prerequisits
The kubectl needs to be installed on the system.

```
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```
Kubectl [Setup](https://kubernetes.io/docs/tasks/tools/install-kubectl/) Reference

# Steps to Deploy on AWS

* Download and install "**Kops**"
* Install the "aws" command line tool suite
* Create an AWS s3 bucket as a "state store"
  * This will store the state of the machine
* Create the cluster using kops

### Linux

```
curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops
```

Kops [Setup](https://github.com/kubernetes/kops) Reference


Install the AWS CLI
```
pip3 install awscli --upgrade --user
```

AWS cli [Setup](https://docs.aws.amazon.com/cli/latest/userguide/installing.html) Reference

Configure the IAM role from the instance where you are going to setup the KOPS.  
Region is very important to specify while setting up the configuration
```
aws configure
AWS Access Key ID [None]:
AWS Secret Access Key [None]:
Default region name [None]: us-east-1
Default output format [None]:
```

Create an AWS S3 bucket as a "state store"  
```
aws s3api create-bucket --bucket docxtract-k8s-test --region us-east-1 --create-bucket-configuration LocationConstraint=us-east-1
```
Once successfully creation of the s3 bucket  

### Let's Create the Cluster using *kops*
* First step is making sure the kops knows where the state store is (.i.e nothing but our s3bucket which we created)
* We will set an Environment varaible where our Kops tool will expect it to be there
    ```bash
    export KOPS_STATE_STORE=s3://docxtract-k8s-test
    export NODE_SIZE=${NODE_SIZE:-t2.nano}
    export MASTER_SIZE=${MASTER_SIZE:-t2.nano}
    export ZONES=${ZONES:-"us-east-1d,us-east-1b,us-east-1c"}
    ```
* Create a cluster using cops
    ```bash
    kops create cluster docxtract-k8s-demo.k8s.local \
    --zones $ZONES \
    --node-size $NODE_SIZE \
    --master-size $MASTER_SIZE --yes
    ```
 * If any error occurrs while creating the cluster for SSH we neeed to set up the ssh
    ```bash
    	ssh-keygen
    ```
 * After that create a cluster (You wont have that proble if you have already have a public Key

 To validate the successful setup of the cops
 ```
 kops validate cluster
 ```

To Delete the cluster
```bash
 kops delete cluster --name docxtract-k8s-demo.k8s.local --yes
```

Create the Kobs Cluster with t2.micro nodes only.
```bash
 kops create cluster --name=docxtract-k8s-demo.k8s.local \
  --zones=us-east-1a \
  --node-size=t2.micro --master-size=t2.micro \
  --master-volume-size=10 \ 
  --node-volume-size=10 \ 
  --yes
```


Suggestions:
 * validate cluster: kops validate cluster
 * list nodes: kubectl get nodes --show-labels
 * ssh to the master: ssh -i ~/.ssh/id_rsa admin@api.docxtract-k8s-demo.k8s.local
 * the admin user is specific to Debian. If not using Debian please use the appropriate user based on your OS.
 * read about installing addons at: https://github.com/kubernetes/kops/blob/master/docs/addons.md.


## High Availabilty

Where we have 3 master nodes.  
It is always recommended to have an odd number of master nodes.
```bash
kops create cluster docxtract-k8s-demo.k8s.local \
--zones us-east-1a,us-east-1a,us-east-1b,us-east-1c \
--node-count 3 \
--master-zones us-east-1a,us-east-1b,us-east-1c --yes
```


## Kubernetes Dashboard

[Kubernetes Dashboard](https://github.com/kubernetes/kops/blob/master/docs/addons.md) Reference

## Creating a persistent volumes.

## Kops Cluster parameters 
[Kops Cluster Parameters](https://github.com/kubernetes/kops/blob/master/docs/cli/kops_create_cluster.md)
Create the Kobs Cluster with t2.micro nodes only.
```bash
 kops create cluster --name=docxtract-k8s-demo.k8s.local \
--zones=us-east-1a \
--cloud=aws \
--cloud-labels=Env=Test,Module=Docxtract \
--master-size=t2.micro \
--master-public-name=master-docxtract-k8s \
--master-security-groups=sg-xxxxxxxxxxxxxx \
--master-volume-size=10 \
--master-zones=us-east-1a \
--node-count=2 \
--node-security-groups=sg-xxxxxxxxxxxxxx \
--node-size=t2.micro \
--node-volume-size=10 \
--subnets=subnet-xxxxxxxxxxxxxx \
--vpc=vpc-xxxxxxxxxxxxxx \
--yes
```
 
 [Custom VPC](https://github.com/kubernetes/kops/blob/master/docs/run_in_existing_vpc.md)