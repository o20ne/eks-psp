# Check all rolebindings
kubectl get rolebindings,clusterrolebindings \
  --all-namespaces  \
  -o custom-columns='KIND:kind,NAMESPACE:metadata.namespace,NAME:metadata.name,SERVICE_ACCOUNTS:subjects[?(@.kind=="ServiceAccount")].name'

# Delete EKS default priviledged access for all users
kubectl delete psp eks.privileged
kubectl delete clusterrole eks:podsecuritypolicy:privileged
kubectl delete clusterrolebindings eks:podsecuritypolicy:authenticated