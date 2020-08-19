# run deployment file
kubectl apply -f kubernetes/deployment.yml
kubectl apply -f kubernetes/service.yml


# chech rollout status of deployment
kubectl rollout status deployment nginx-deployment

# describe deployment
kubectl describe deployment nginx-deployment
