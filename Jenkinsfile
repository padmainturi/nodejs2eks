pipeline {
   //echo "GitHub BranhName ${env.BRANCH_NAME}"
   //echo "Jenkins Job Number ${env.BUILD_NUMBER}"
   echo "Jenkins Node Name ${env.NODE_NAME}"
   
   echo "Jenkins Home ${env.JENKINS_HOME}"
   echo "Jenkins URL ${env.JENKINS_URL}"
   echo "JOB Name ${env.JOB_NAME}"


   properties([
     buildDiscarder(logRotator(numToKeepStr: '10')),
     pipelineTriggers([
        pollSCM('* * * * *')
    ])
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
