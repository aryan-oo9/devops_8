pipeline {
    agent any
    
    tools {
        // This MUST match the name you gave in Manage Jenkins > Tools
        terraform 'terraform' 
    }

    environment {
        // Updated credential binding to avoid the 'Unknown parameter' warning
        AWS_ACCESS_KEY_ID     = credentials('aws-creds')
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds')
    }

    stages {
        stage('Terraform Init') {
            steps {
                // Jenkins will now download Terraform into the container before running this
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Approval') {
            steps {
                input "Apply changes to AWS?"
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}