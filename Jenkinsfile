pipeline {
    agent any
        tools{
        maven 'maven'
        }
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build and Package') {
            steps {
                sh 'mvn clean install package'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t amir1adel/pipeline:1.0 EcommerceApp/.'
            }
        }
        stage('Remove Existing Docker Container') {
            steps {
                sh 'docker stop yourapp || true'
                sh 'docker rm yourapp || true'
            }
        }
        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 8082:8080 --name Eco-app-by-pipeline amir1adel/pipeline:1.0'
            }
        }
        
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'DockerHubCreds', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                    sh 'docker push amir1adel/pipeline:1.0'
                } 
            }
        }
    }
