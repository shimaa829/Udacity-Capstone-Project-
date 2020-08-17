pipeline {
     environment {
	    registry = "shimaa96"
            dockerVersion = 'latest'
	    registryCredential = 'dockerhub_access'
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
              
                    docker.withRegistry('', '${registryCredential}') {
                        dockerImage.push()
                    }
                }
            }
        }
       
     }    
  }
