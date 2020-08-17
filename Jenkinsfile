pipeline {
     environment {
	    registry = "shimaa96"
            dockerVersion = 'latest'
	    dockerImage = 'capston-image'
     }
     agent any
     stages {
        
         stage('Lint') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }

         stage('Docker Build') {
            steps {
                  script {
                     dockerImage = docker.build('${registry}/${dockerImage}:${dockerVersion}')
                    }
             }
        }
        stage('Docker Push') {
            steps {
                script {
              
                    docker.withRegistry('', 'dockerhub_access') {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Deploy K8S') {
            steps {
                withAWS(credentials: 'aws-access', region: 'us-west-2') {
                    sh './cloudformation/create.sh MyCapstoneStack-Shimaa cloudformation/capstone_infrastructure.yml cloudformation/infra_parameters.json'
                 
                }
            }
        }
       
     }    
  }
