pipeline {
    agent any
    
    tools {
        terraform 'terraform' // Matches the name in Global Tool Configuration
    }

    environment {
        // Correct way to bind AWS credentials for a Windows agent
        AWS_ACCESS_KEY_ID     = credentials('aws-creds')
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds')
    }

    stages {
        stage('Terraform Init') {
            steps {
                // Use 'bat' for Windows instead of 'sh'
                bat 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                bat 'terraform plan'
            }
        }
        stage('Approval') {
            steps {
                input "Approve build?"
            }
        }
        stage('Terraform Apply') {
            steps {
                bat 'terraform apply -auto-approve'
            }
        }
        stage('Ansible Configure') {
            steps {
                // For Ansible, we use the WSL command because Ansible is in Ubuntu
                bat 'wsl ansible-playbook playbook.yml'
            }
        }
    }
}