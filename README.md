# Node.js sample app

The original repository has been forked and the repo used is https://github.com/anchaubey/nodejs-sample-app with few more files created.

GITHUB Repo used: https://github.com/anchaubey/nodejs-sample-app.git

1) jenkinsfile is created for pipeline job with below steps:

i) Build nodejs app
ii) Dockerize the nodejs app
iii) Pulish docker image to dockerhub

2) We have a Dockerfile that is used to build the docker image.

3) For deployment of image to kubernetes, we have a pods.yaml file to create 3 replicas of the app and a service.yaml file for access the app externally. The app is exposed on port 30083 for the outside world.
We have to run below commands for pods and service creation:

kubectl create -f pods.yaml
kubectl create -f service.yaml
