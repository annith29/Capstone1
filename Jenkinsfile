pipeline{
    agent any
    
    stages{
        stage('start'){
            steps{
                sh 'npm install'
            }
        }
        stage('run build.sh'){
            steps{
                checkout scmGit(branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/annith29/Capstone1.git']])
                 sh 'npm run build'
                 sh 'chmod +x ./build.sh'
                 sh './build.sh'
            }
        }
        stage('push Dev Repo'){
             when {
              expression { BRANCH_NAME == 'dev' }
            }
            steps{
                DOCKERHUB_CREDENTIALS=credentials('dockerid') {
                sh 'chmod 777 ./deploy.sh'
                sh './deploy.sh'
                }
            }
        }
        stage('push Prod repo'){
            when {
              expression { BRANCH_NAME == 'master' }
            }
            steps {
                DOCKERHUB_CRED1ENTIALS=credentials('dockerid') {
                    sh 'sudo docker login -u annith29 --password=${docker_password}'
                    sh 'sudo docker tag react-app:latest annith29/dev:react-app'
                    sh 'sudo docker push annith29/dev:react-app'
                 
                }           
            }
        }    
    }
}
