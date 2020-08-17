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

         stage('Build Docker') {
            steps {
                  script {
                     dockerImage = docker.build('${registry}/${dockerImage}:${dockerVersion}')
                    }
            }
        }
       
     }    
  }
