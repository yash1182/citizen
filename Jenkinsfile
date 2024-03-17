pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git(url: 'https://github.com/yash1182/citizen', branch: 'master')
      }
    }

    stage('Build') {
      steps {
        sh '''directory=$(pwd);
sudo docker build -t citizen:1.0.0 .'''
      }
    }

  }
}