pipeline {
    agent any

    environment {
        DOCKERHUB_REPO = 'shridhar143/myapp'
    }

    stages {
        stage('Clone repository') {
            steps {
                script {
                    git branch: 'main', credentialsId: 'SHRIDHARMUDASHI', url: 'https://github.com/SHRIDHARMUDASHI/kubernetesapp.git'
                }
            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    dockerImage = docker.build("${env.DOCKERHUB_REPO}:latest")
                }
            }
        }

        stage('Push Docker image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials-id') {
                        dockerImage.push()
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
