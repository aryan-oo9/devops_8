pipeline {
    agent any
    
    tools {
        terraform 'terraform' 
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-creds')
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds')
    }

    stages {
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                // The 'retry' helps if the network or pod lags briefly
                retry(2) {
                    sh 'terraform plan'
                }
            }
        }
        stage('Approval') {
            steps {
                input "Deploy to AWS?"
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}