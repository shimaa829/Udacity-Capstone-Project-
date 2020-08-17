pipeline {
     environment {
	    registry = "shimaa96/capston-image"
            dockerVersion = 'latest'
	    registryCredential = 'dockerhub_access'
	    dockerImage = ''
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
                     dockerImage = docker.build registry + :dockerVersion
                    }
            }
        }
       
     }    
  }
