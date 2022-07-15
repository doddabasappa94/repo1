pipeline {
    agent any
    tools {
       maven 'maven-3.5.0'
    }
     parameters{
        choice(name: 'CHOICE', choices: ['Repo1', 'Repo2', 'All'], description: 'Which one you want checkout')}
    stages{
          stage ('checkout') {
              steps{
                  script {
                     switch(params.CHOICE) {
                        case "Repo1":
                        echo 'rep1 is executed'
                        git branch: 'main', url: 'https://github.com/doddabasappa94/rep1.git'
                        sh 'mvn clean install';
                        break
                        case "Repo2": 
                        echo 'Rep2 is executed'
                        git branch: 'main', url: 'https://github.com/doddabasappa94/rep2.git'
                        sh 'mvn clean install'; 
                        break
                        case "All":
                        echo 'All Repo is executed'
                        stages {
                            stage('Both Repo'){
                        Parallel {
                            stage ('Repo1'){
                                steps{
                                echo'Repo1 Executed'
                               git branch: 'main', url: 'https://github.com/doddabasappa94/rep1.git'
                               sh 'mvn clean install'
                            }
                            }
                            Stege ('Repo2'){
                                steps {
                                echo 'Repo2 excuted'
                                git branch: 'main', url: 'https://github.com/doddabasappa94/rep2.git'
                                sh 'mvn clean install'}}}}}; 
                        break
                     }
                  }
              }
          }
         stage('Build'){
         parallel {
                    stage('Build docker app1 image'){
            steps{
                script{
                    sh 'docker build -t doddabasappah/devops-app1 .'
                }
            }
        }
             
               stage('Build docker app2 image'){
            steps{
                script{
                    sh 'docker build -t doddabasappah/devops-app2 .'
                }
            }
        }
         }
         }
        stage ('Push') {
            parallel{
            stage('Push app1 image to Hub'){
             steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u doddabasappah -p ${dockerhubpwd}'
                     }
                   sh 'docker push doddabasappah/devops-app1'
                }
             }
            }
            stage('Push app2 image to Hub'){
             steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u doddabasappah -p ${dockerhubpwd}'
                     }
                   sh 'docker push doddabasappah/devops-app2'
                }
             }
            }
         }
         }
        stage(' Deploy to k8s'){
              parallel {
                stage('Deploy app1 to k8s'){
            steps{
                script{
                    kubernetesDeploy (configs: 'deploymentservice1.yaml',kubeconfigId: 'k8sconfigpwd')
                }
            }
         }
         stage('Deploy app2 to k8s'){
            steps{
                script{
                    kubernetesDeploy (configs: 'deploymentservice2.yaml',kubeconfigId: 'k8sconfigpwd')
                    }
                }
             }
         }
        }
    
    }
}
