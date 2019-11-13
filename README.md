# eks-psp

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
kubectl create deployment nginx --image=nginx # this should fail as it's running as root
