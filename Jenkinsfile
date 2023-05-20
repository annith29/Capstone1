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
                echo "Check with ip address http://:http://13.234.34.244/80"
        
            }
        }
        stage("Push to Docker Dev"){
            steps{
                sh 'sudo docker login -u annith29 --password=${docker_password}'
                sh 'sudo docker tag react-app:latest annith29/dev:react-app'
                sh 'sudo docker push annith29/dev:react-app'
                echo "image push at  dev dockerhub"
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
