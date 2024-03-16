pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git(url: 'https://github.com/yash1182/citizen', branch: 'master')
      }
    }

    stage('Build Docker') {
      steps {
        sh '''DOCKER_REG_HOST=localhost:8083/nexus

image_name=$(jq -r .name package.json)
image_tag=$(jq -r .version package.json)

sudo docker build . -t $image_name:$image_tag --network=host'''
        sh 'sudo docker tag $image_name:$image_tag $DOCKER_REG_HOST/$image_name:$image_tag'
        sh 'sudo docker push $DOCKER_REG_HOST/$image_name:$image_tag'
      }
    }

  }
}