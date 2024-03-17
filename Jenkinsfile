pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git(url: 'https://github.com/yash1182/citizen.git', branch: 'master')
      }
    }

    stage('Docker Build') {
      steps{
        app = docker.build("yash1182/citizen")
      }
    }

  }
}