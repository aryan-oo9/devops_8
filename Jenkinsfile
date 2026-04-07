pipeline {
    agent any
    
    tools {
        terraform 'terraform' 
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-creds')
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds')
        // This adds the local bin to the path so Jenkins can find the new ansible
        PATH = "$HOME/.local/bin:$PATH"
    }

    stages {
        stage('Install Ansible (Local)') {
            steps {
                // This uses 'pip' (Python) to install ansible in a folder Jenkins owns
                // No 'sudo' or 'root' required!
                sh 'python3 -m pip install --user ansible'
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
                input "Proceed with AWS deployment?"
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