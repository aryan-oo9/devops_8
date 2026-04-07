pipeline {
    agent any
    
    tools {
        terraform 'terraform'
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-creds')
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds')
        // Prevents Terraform from hanging on interactive prompts
        TF_IN_AUTOMATION      = 'true'
    }

    stages {
        stage('Terraform Init') {
            steps {
                sh 'terraform init -input=false'
            }
        }
        stage('Terraform Plan') {
            steps {
                // If it doesn't finish in 5 mins on an i9, something is wrong
                timeout(time: 5, unit: 'MINUTES') {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
        stage('Approval') {
            steps {
                input "Does the plan look correct? Deploy to AWS?"
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}