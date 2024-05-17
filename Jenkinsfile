pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
    }
    
    stages {
        stage('clean Workspace') {
            steps {
                cleanWs() // Assuming you want to clean workspace before proceeding
            }
        }

        stage('Checkout') {
            steps {
                sh 'git clone https://github.com/ibhavneshbaghel2213/SCYLLADB-INFRA.git infra'
            }
        }

        stage('Terraform Process') {
            steps {
                script {
                    // Initialize Terraform for infra/network
                    dir('infra/infra/network') {
                        sh 'ls -l'
                        sh 'terraform init'
                        if (fileExists('main.tf')) {
                            executeTerraform('.')
                        } else {
                            error "Terraform configuration files not found in the directory"
                        }
                    }

                    // Set AWS credentials as environment variables
                        // If autoApprove is false, prompt for confirmation
                        if (!params.autoApprove) {
                            def plan = readFile 'infra/infra/network/myTerraformPlan.txt'
                            def userAction = input(
                                message: 'Do you want to apply the plan?',
                                parameters: [
                                    text(name: 'Plan', description: 'Please review the plan', defaultValue: plan),
                                    choice(name: 'action', choices: ['apply', 'destroy'], description: 'Select the action to perform')
                                ],
                                submitter: 'admin'
                            )

                            if (userAction.action == 'apply') {
                                terraformApplyStage()
                            } else if (userAction.action == 'destroy') {
                                terraformDestroyStage()
                            } else {
                                error 'Invalid action selected. Please choose either "apply" or "destroy".'
                            }
                        } else {
                            if (params.action == 'apply') {
                                terraformApplyStage()
                            } else if (params.action == 'destroy') {
                                terraformDestroyStage()
                            } else {
                                error 'Invalid action selected. Please choose either "apply" or "destroy".'
                            }
                        }
                    }
                    
                }
            }
        }
    }


// Function to execute Terraform for a specific directory
def executeTerraform(directory) {
    dir(directory) {
        sh "terraform plan -out tfplan > /dev/null"
        sh "terraform show -no-color tfplan > myTerraformPlan.txt"
    }
}

// Nested stages for applying resources
def terraformApplyStage() {
    dir('infra/infra/network') {
        sh 'terraform apply --auto-approve'
        }
    }


// Nested stages for destroying resources
def terraformDestroyStage() {
    dir('infra/infra/network') {
        sh 'terraform destroy --auto-approve'
    }
}

