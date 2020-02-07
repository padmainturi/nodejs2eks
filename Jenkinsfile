pipeline {
  agent any
    
  tools {nodejs "node"}
    
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
