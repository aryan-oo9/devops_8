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
        stage('Install Ansible') {
            steps {
                // This installs ansible inside the Jenkins Linux environment
                sh 'apt-get update && apt-get install -y ansible'
            }
        }
        stage('Terraform Init') {
            steps {
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
                input "Approve build?"
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
        stage('Ansible Configure') {
            steps {
                sh 'ansible-playbook playbook.yml'
            }
        }
    }
}