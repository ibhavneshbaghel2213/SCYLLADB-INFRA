pipeline {
    agent any
    stages {
        stage('Parameters'){
                steps {
                    script {
                    properties([
                            parameters([                  
                             string(defaultValue: 'database', description: 'path of code directory', name: 'code_dir'),
                             
                            ])
                        ])
                    }
                }
            }    
        stage('clean Workspace') {
            steps { 
                cleanWs ()
            }
        }
        stage('git clone') {
            steps {
                git branch: 'terraform', credentialsId: '27bbe006-7541-42ae-be76-7a5ca6e59058', url: 'https://gitlab.com/bhavnesh.baghel22/final-assessment.git'
            }
        }

        stage('terraform Init') {
            steps{
                dir("${code_dir}") {
                    sh 'terraform init'
                }
               
            }
        }
        stage('terraform plan') {
            steps{
                dir("${code_dir}") {
                    sh 'terraform plan'
                }
               
            }
        }
        stage('terraform approval') {
            steps{
                input 'Do you want to approve'
                }
            }
        stage('terraform apply') {
            steps{
                dir("${code_dir}") {
                    sh 'terraform apply --auto-approve'
                }
                
            }
        }
        stage('Slack Notification') {
            steps{
                dir("${code_dir}") {
                    slackSend channel: '#redis-tool-notification', message: "${code_dir} Infra Created Successfully", teamDomain: 'opstree', tokenCredentialId: '1df1ee9f-ed1b-46cd-b16e-177a8b240cb0'
                }
            }
        }
        
    }
}
