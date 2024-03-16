pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git(url: 'https://github.com/yash1182/citizen.git', branch: 'develop')
      }
    }

    stage('Docker Build') {
      steps {
        sh '''DOCKER_REG_HOST=localhost:8083/nexus

ls -a

image_name=$(jq -r .name package.json)
image_tag=$(jq -r .version package.json)

sudo docker build . -t $image_name:$image_tag --network=host'''
      }
    }

  }
}