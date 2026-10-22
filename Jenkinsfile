pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t devops-website .'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    docker rm -f devops-website || true
                    docker run -d \
                      --name devops-website \
                      --restart unless-stopped \
                      -p 80:80 devops-website
                '''
            }
        }

        stage('Verify') {
            steps {
                sh 'docker ps'
                sh 'curl -f http://localhost/'
            }
        }
    }
}
