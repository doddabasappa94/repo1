pipeline {
    agent any
        tools {
       maven 'maven-3.5.0'
    }
    parameters{
    choice(name: 'CHOICE', choices: ['Repo1', 'Repo2', 'All'], description: 'Which one you want checkout')}
    stages {
          stage ('checkout') {
              steps{
                  script {
                      switch(${params.CHOICE}) {
                        case "Repo1":
                               echo 'Repo1 is executed'
                               git branch: 'main', url: 'https://github.com/doddabasappa94/repo1.git';
                        break
                        case "Repo2": 
                               echo 'Repo2 is executed'
                               git branch: 'main', url: 'https://github.com/doddabasappa94/repo2.git'; 
                        break
                        case "All":
                       
                        git 'git branch: \'main\', url: \'https://github.com/doddabasappa94/repo1.git\'' 
                      
                        git 'git branch: \'main\', url: \'https://github.com/doddabasappa94/repo2.git\''; 
                        break
                    }
                  }
              
              }
          }
           stage ('Test and Build') {
             steps{
             script{
                 sh 'mvn clean install'
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
                   sh 'docker push doddabasappah/devops-app1'
                }
            }
            }
    }
    
}
