pipeline {
    agent any
    
    /* This section tells Jenkins to find the 'terraform' tool you configured */
    tools {
        terraform 'terraform' 
    }

    environment {
        /* Fix the credential binding for AWS */
        AWS_ACCESS_KEY_ID     = credentials('aws-creds')
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                /* Jenkins will now automatically add Terraform to the PATH */
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
                input 'Do you want to apply these changes to AWS?'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
        stage('Ansible Configure') {
            steps {
                /* Use the tool name for ansible as well */
                sh 'ansible-playbook playbook.yml'
            }
        }
    }
}