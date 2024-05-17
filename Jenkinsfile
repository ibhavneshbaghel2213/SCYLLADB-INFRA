// pipeline {
//     agent any

//     parameters {
//         booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
//         choice(name: 'action', choices: ['apply', 'destroy'], description: 'Select the action to perform')
//     }

//     environment {
//         AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
//         AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
//     }

//     stages {
//         stage('Checkout') {
//             steps {
//                 git branch: 'main', url: 'https://github.com/ibhavneshbaghel2213/SCYLLADB-INFRA.git'
//             }
//         }

//         stage('Terraform Process') {
//             steps {
//                 script {
//                     dir('infra/network') {
//                         sh 'terraform init'
//                     }
//                     // Execute Terraform for infra/network
//                     executeTerraform('infra/network')
                    
//                     // Initialize Terraform for infra/database
//                     // dir('infra/database') {
//                     //     sh 'terraform init'
//                     // }
//                     // // Execute Terraform for infra/database
//                     // executeTerraform('infra/database')
//                     if (!params.autoApprove) {
//                     def plan = readFile 'myTerraformPlan.txt'
//                         input message: 'Do you want to apply the plan?',
//                         parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
//                     }
//                     if (params.action == 'apply') {
//                         terraformApplyStage()
//                     } else if (params.action == 'destroy') {
//                         terraformDestroyStage.()
//                     } else {
//                         error 'Invalid action selected. Please choose either "apply" or "destroy".'
//                     }
//                 }
//             }
//         }
//     }
// }

// // Function to execute Terraform for a specific directory
// def executeTerraform(directory) {
//     dir(directory) {
//         sh "terraform plan -out tfplan"
//         sh "terraform show -no-color tfplan > myTerraformPlan.txt"
//     }
// }

// // Nested stages for applying resources
// def terraformApplyStage() {
//     stage('Apply') {
//         steps {
//             script {
//                 sh 'terraform apply -input=false tfplan'
//             }
//         }
//     }
// }

// // Nested stages for destroying resources
// def terraformDestroyStage() {
//     stage('Destroy') {
//         steps {
//             sh 'terraform destroy --auto-approve'
//         }
//     }
// }
