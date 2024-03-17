pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git(url: 'https://github.com/yash1182/citizen.git', branch: 'master')
      }
    }

    stage('Docker Build') {
      steps {
        sh '''image_name=$(jq -r .name package.json)
image_tag=$(jq -r .version package.json)
echo "starting build"
docker build . -t $image_name:$image_tag --network=host'''
      }
    }

  }
}