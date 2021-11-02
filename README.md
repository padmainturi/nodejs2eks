# Node.js sample app

1) jenkinsfile is created for pipeline job with below steps:

i) Build nodejs app

ii) Dockerize the nodejs app

iii) Pulish docker image to dockerhub


2) We have a Dockerfile that is used to build the docker image.


Plugin installed for docker build and push:- CloudBees Docker Build and Publish plugin


Also, docker_ID credentials has been created under credentails section for Docker Hub authentication(within Jenkinsfile)


3) For deployment of image to kubernetes, we have a pods.yaml file to create 3 replicas of the app and a service.yaml file for accessing the app externally. The app is exposed on port 30083 for the outside world.

We have to run below commands for pods and service creation:

kubectl create -f pods.yaml

kubectl create -f service.yaml

we have see all the running pods running "kubect get po".

To see the created service, we shall run "kubectl get svc"

I was facing issues using minikube on my laptop, and therefore I have used kubernetes cluster already setup on my laptop. 
