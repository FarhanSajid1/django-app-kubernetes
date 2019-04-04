# building the images
docker build -t farhansajid2/django-app-k8s:latest -t farhansajid2/django-app-k8s:$SHA -f ./docker/prod/Dockerfile .


# pushing the image to docker hub
docker push farhansajid2/django-app-k8s:lastest
docker push farhansajid2/django-app-k8s:$SHA

# applying kubectl configs
kubectl apply -f k8s
kubectl set image deployment/app-deployment app=farhansajid2/django-app:$SHA
