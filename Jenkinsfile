pipeline {

  properties([
    [$class: 'jenkins.model.BuildDiscarderProperty', strategy: [$class: 'LogRotator', numToKeepStr: '10']],
    pipelineTriggers([[$class:"SCMTrigger", scmpoll_spec:"* * * * *"]]),
    ])

   environment {
     dockerRegistry = "anchaubey/nodenewapp"
     dockerRegistryCredential = 'docker_ID'
     dockerImage = ''
   }
   agent any
   stages {
     stage('Cloning Git') {
       steps {
          git branch: 'master', url: 'https://github.com/anchaubey/nodejs-sample-app.git'   
       }
     }
     stage('Build') {
        steps {
          sh 'npm install'
        }
     }
     stage('Building image') {
       steps{
         script {
           dockerImage = docker.build dockerRegistry + ":$BUILD_NUMBER"
         }
       }
     }
     stage('Upload Image') {
       steps{
         script {
           docker.withRegistry( '', dockerRegistryCredential ) {
             dockerImage.push()
           }
         }
       }
     }
     stage('Remove Unused docker image') {
       steps{
         sh "docker rmi $dockerRegistry:$BUILD_NUMBER"
       }
     }
     stage('SendEmailNotification')
     {
 
 emailext body: '''Build is over

 Regards,
 Ankit Chaubey,
 8860379656''', subject: 'Buid is over', to: 'ankitchaubey091987@gmail.com'
     }
   }
 }
