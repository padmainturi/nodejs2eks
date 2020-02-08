pipeline {

   environment {
     dockerRegistry = "anchaubey/nodenewapp"
     dockerRegistryCredential = 'docker_ID'
     dockerImage = ''
   }
   agent any
   stages {
     stage('Cloning Git') {
       steps {
          checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'GITHUB_LOGIN', url: 'https://github.com/anchaubey/nodejs-sample-app.git']]]   
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

   }
 }
