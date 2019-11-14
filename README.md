# eks-psp

By default, EKS 1.13 and above creates a default policy named eks.privileged that has no restriction on what kind of pod can be accepted into the system (equivalent to running the cluster with the PodSecurityPolicy controller disabled).

Reference: https://aws.amazon.com/blogs/opensource/using-pod-security-policies-amazon-eks-clusters/

This repository target to implement restricted policies to default users.

It is not working now...

## Create privileged Pod Security Policy
kubectl apply -f ./internal-privileged/privileged-psp.yaml

kubectl apply -f ./internal-privileged/privileged-clusterrole.yaml

kubectl apply -f ./internal-privileged/privileged-clusterrolebinding.yaml


## Create restricted Pod Security Policy
kubectl apply -f ./cluster-restricted/restricted-psp.yaml

kubectl apply -f ./cluster-restricted/restricted-clusterrole.yaml

kubectl apply -f ./cluster-restricted/restricted-clusterrolebinding.yaml


## Delete EKS default priviledged access for all users
kubectl delete psp eks.privileged

kubectl delete clusterrole eks:podsecuritypolicy:privileged

kubectl delete clusterrolebindings eks:podsecuritypolicy:authenticated


## Create deployment ngnix, which is default to run as root
kubectl create deployment nginx --image=nginx -n default # this should fail as it's running as root
