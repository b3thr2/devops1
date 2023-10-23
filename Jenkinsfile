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
                sh 'whoami'
                sh 'pwd'
                sh 'ls -l'
                sh 'mvn clean install package'
            }
        }
        
        stage('Build Docker Image') {
            steps {
            sh 'whoami'
            sh 'pwd'
            sh 'ls -l'
            sh 'docker build -t b3thr2/aziz:3.1 .'
            }
        }
        stage('Remove Existing Docker Container') {
            steps {
                sh 'docker stop Eco-app-by-pipeline || true'
                sh 'docker rm Eco-app-by-pipeline || true'
            }
        }
       stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([usernamePassword(credentialsId: 'dockerhub-pwd', usernameVariable: 'USER' , passwordVariable: 'PASS')]) {
                   sh 'docker login -u ${USER} -p ${PASS}'

}
                   sh 'docker push b3thr2/aziz:3.1'

                }
            }
        }
    }
}
