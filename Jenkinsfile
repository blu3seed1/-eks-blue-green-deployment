pipeline {
  agent any
  stages {
    stage('Lint') {
      steps {
        sh 'cd blue && docker run --rm -i hadolint/hadolint < Dockerfile && cd ..'
        sh 'cd green && docker run --rm -i hadolint/hadolint < Dockerfile && cd ..'
      }
    }

    stage('Build') {
      steps {
        sh '''cd blue && docker build -t deployblue . && cd ..'''
	sh '''cd green && docker build -t deploygreen . && cd ..'''
      }
    }

    stage('Push ') {
      steps {
        sh 'cd blue && ./upload_docker.sh && cd ..'
        sh 'cd green && ./upload_docker.sh && cd ..'
      }
    }

  }
}
