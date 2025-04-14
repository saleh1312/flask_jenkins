pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/saleh1312/flask_jenkins'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t flask_jenkins_app .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 5000:5000 --name flask_jenkins_container flask_jenkins_app'
            }
        }
    }
}
