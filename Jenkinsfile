pipeline {
    agent any
    tools { terraform 'terraform' }
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-creds')
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds')
    }
    stages {
        stage('Automated Deploy') {
            steps {
                // We do everything in one go to keep memory usage low
                sh '''
                    terraform init -input=false
                    terraform apply -auto-approve
                '''
            }
        }
    }
}