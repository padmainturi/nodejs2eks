pipeline {
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
  }
}
