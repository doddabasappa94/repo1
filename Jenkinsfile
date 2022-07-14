pipeline {
    agent any
    parameters{
    choice(name: 'CHOICE', choices: ['Repo1', 'Repo2', 'All'], description: 'Which one you want checkout')}
    stages {
          stage ('checkout') {
              steps{
                  script {
                    switch(params.CHOICE) {
                        case "Repo1":
                               echo 'Repo1 is executed'
                               git branch: 'main', url: 'https://github.com/doddabasappa94/repo1.git';
                        break
                        case "Repo2": 
                               echo 'Repo2 is executed'
                               git branch: 'main', url: 'https://github.com/doddabasappa94/repo2.git'; 
                        break
                        case "All":
                               echo 'All Repo is executed'
                               echo 'Repo1 Executed'
                               git branch: 'main', url: 'https://github.com/doddabasappa94/repo1.git'
                               echo 'RepO2 excuted'
                               git branch: 'main', url: 'https://github.com/doddabasappa94/repo2.git'; 
                        break
                    }
                  }
              
              }
          }
            stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t doddabasappah/devops-app1 .'
                      }
                }
            }
            stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) 
                   {
                   sh 'docker login -u doddabasappah -p ${dockerhubpwd}' }
                   sh 'docker push doddabasappah/devops-integration'
                }
            }
            }
    }
    
}
