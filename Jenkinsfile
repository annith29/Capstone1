pipeline{
    agent any
    
    stages{
        stage("Build"){
            steps{
                echo "We are in Build step now"
                
                git branch: 'dev', url: 'https://github.com/annith29/Capstone1.git'
                sh 'chmod +x ./build.sh'
                sh 'sh ./build.sh'
                
            }
        }
        stage("Deploy to the site"){
            steps{
                echo "We are in deploy stage. Lets deploy the image now using docker compose"
                sh 'docker-compose up -d'
                echo "Check with ip address http://http://13.234.232.73/:80"
        
            }
        }
        stage("Push to Docker Dev"){
            steps{
                echo "Now, lets push the image to dev repository in docker"
                withCredentials([usernamePassword(credentialsId: 'dockerhub_id', passwordVariable: 'docker_password', usernameVariable: 'docker_username')]) {
                    sh 'docker login --username=${docker_username} --password=${docker_password}'
                    sh 'docker tag annith29/capstone-public-dev:${BUILD_NUMBER} annith29/capstone-public-dev:latest'
                    sh 'docker push annith29/capstone-public-dev:latest'
                }
                
            }
                 
            }
    }

post{
    always{
        echo "A normal messgae which gets printed on success or failure. "
    }
    success{
        echo "Its success"
    }
    failure{
        echo "Its failure"
    }
}
}
