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
                        echo 'rep1 is executed'
                        git branch: 'main', url: 'https://github.com/doddabasappa94/rep1.git';
                        break
                        case "Repo2": 
                        echo 'Rep2 is executed'
                        git branch: 'main', url: 'https://github.com/doddabasappa94/rep2.git'; 
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
                            }
                            }
                            Stege ('Repo2'){
                                steps {
                                echo 'Repo2 excuted'
                                git branch: 'main', url: 'https://github.com/doddabasappa94/rep2.git'}}}}}; 
                        break
                     }
                  }
              }
          }
    }
}
