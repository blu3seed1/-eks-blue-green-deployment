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
        sh 'cd blue && docker build -t deployblue:capstone . && cd ..'
        sh 'cd green && docker build -t deploygreen:capstone . && cd ..'
      }
    }

    stage('Push ') {
      steps {
        sh 'cd blue && ./upload_docker.sh && cd ..'
        sh 'cd green && ./upload_docker.sh && cd ..'
      }
    }

    stage('Set EKS Cluster') {
      steps {
        sh 'kubectl config use-context arn:aws:eks:us-east-1:818176152437:cluster/capstone1'
      }
    }

    stage('Create Controllers') {
      steps {
        sh 'cd blue && kubectl apply -f ./blue-controller.json && cd ..'
        sh 'cd green && kubectl apply -f ./green-controller.json && cd ..'
      }
    }

    stage('Create ELB') {
      steps {
        sh 'kubectl apply -f ./blue-green-service.json'
      }
    }

    stage('') {
      steps {
        sh 'kubectl describe svc | grep "LoadBalancer Ingress:"'
      }
    }

  }
}