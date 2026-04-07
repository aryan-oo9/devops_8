pipeline {
    agent any
    environment {
        AWS_CREDS = credentials('aws-creds') // The ID you gave your keys in Jenkins
    }
    stages {
        stage('Checkout') {
            steps { checkout scm }
        }
        stage('Terraform Init') {
            steps { sh 'terraform init' }
        }
        stage('Terraform Plan') {
            steps { sh 'terraform plan' }
        }
        stage('Approval') {
            steps { input 'Do you approve this infrastructure build?' }
        }
        stage('Terraform Apply') {
            steps { sh 'terraform apply -auto-approve' }
        }
        stage('Ansible Configure') {
            steps { sh 'ansible-playbook playbook.yml' }
        }
    }
}