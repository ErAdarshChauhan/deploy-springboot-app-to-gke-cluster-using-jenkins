pipeline {
    agent any
    tools{
        maven 'maven'
    }

    stages{
        stage('Build Maven'){
            steps{
               checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ErAdarshChauhan/Spring-Boot-With-MongoDB-Atlas_Live-DB-inGCP-Flexible-App-Engine.git']])
                sh 'mvn clean install'
            }
        }
         stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t eradarshchauhan/app .'
                }
            }
        }
        stage('Push image to hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerpwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u eradarshchauhan -p ${dockerhubpwd}'

                    }
                    sh 'docker push eradarshchauhan/app'
                }
            }
        }
//          stage('Deploy to K8s'){
//             steps{
//                 script{
//                     kubernetesDeploy (configs: 'deploymentservice.yaml',kubeconfigId: 'kubeconfig')
//                 }
//             }
//         }

    }
}
