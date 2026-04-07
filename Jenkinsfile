pipeline {
    agent any
    
    tools {
        // This must match the 'Name' you gave in Global Tool Configuration
        terraform 'terraform' 
    }

    environment {
        // Using this format fixes the 'Unknown parameter' warning in your logs
        AWS_ACCESS_KEY_ID     = credentials('aws-creds')
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds')
    }

    stages {
        stage('Terraform Init') {
            steps {
                // Jenkins will now download the Linux version into the container
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
                input "Do you want to provision AWS resources?"
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}