# run deployment file
kubectl apply -f deployment.yml
kubectl apply -f service.yml


# Set created image to do a rolling update
kubectl set image deployment nginx-deployment nginx=nginx:1.9

# check rollout status of deployment
kubectl rollout status deployment nginx-deployment

# describe deployment
sleep 10
kubectl describe deployment nginx-deployment
