pipeline {
    agent any
    
    tools {
        terraform 'terraform' 
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-creds')
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds')
        TF_IN_AUTOMATION      = 'true'
    }

    stages {
        stage('Automated AWS Deploy') {
            steps {
                sh '''
                    terraform init -input=false
                    # This flag is the magic fix for the JENKINS-48300 crash
                    terraform apply -auto-approve -parallelism=1
                '''
            }
        }
    }
}