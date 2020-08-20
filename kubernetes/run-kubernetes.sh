# run deployment file
sudo kubectl apply -f deployment.yml
sudo kubectl apply -f service.yml


# Set created image to do a rolling update
sudo kubectl set image deployment nginx-deployment nginx=nginx:1.9

# check rollout status of deployment
sudo kubectl rollout status deployment nginx-deployment

# describe deployment
sudo sleep 10
sudo kubectl describe deployment nginx-deployment
