pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                echo 'Code checkout completed'
            }
        }

        stage('Build Application') {
            steps {
                sh '''
                cd app
                mvn clean package
                '''
            }
        }

        stage('Docker Build') {
            steps {
                sh '''
                cd app
                docker build -t voting-app .
                '''
            }
        }

        stage('Deploy Application') {
            steps {
                sh '''
                docker stop voting-app || true
                docker rm voting-app || true
                docker run -d -p 8080:8080 --name voting-app voting-app
                '''
            }
        }
    }
}
