pipeline {
    agent any
    tools{
        maven 'maven'
        }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        // Define other stages here
        stage('Build and Package') {
            steps {
                sh 'mvn clean install package'
                sh 'sudo docker cp jenkinsContainer:/var/jenkins_home/workspace/CICD_TEST_PIPELINE_DEPLOYING_ECOMM_APP/target/EcommerceApp.war /root/git-repo-testPIPELINE/pipeline-automation'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t amir1adel/pipeline:1.0 .'
            }
        }
        stage('Remove Existing Docker Container') {
            steps {
                sh 'docker stop Eco-app-by-pipeline || true'
                sh 'docker rm Eco-app-by-pipeline || true'
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
}
