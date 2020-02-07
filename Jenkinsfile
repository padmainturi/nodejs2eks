pipeline {  environment {
    registry = "anchaubey/docker_node_build"
    registryCredential = 'docker_ID'
    dockerImage = ''
  }
  agent any
    
  stages {
        
    stage('Git') {
      steps {
        git 'https://github.com/anchaubey/nodejs-sample-app.git'
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
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
