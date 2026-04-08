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
                // 1. Copy the .tf files to the container's high-speed temporary storage
                sh 'mkdir -p /tmp/fast_workspace && cp *.tf /tmp/fast_workspace/'
                
                // 2. Tell Jenkins to switch into that fast directory to do the heavy lifting
                dir('/tmp/fast_workspace') {
                    sh '''
                        terraform init -input=false
                        terraform apply -auto-approve -parallelism=1
                    '''
                }
            }
        }
    }
}