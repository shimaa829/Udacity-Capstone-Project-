pipeline {
     agent any
     stages {
        
         stage('Lint') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }

         stage('Build Docker') {
            steps {
                sh "docker build --tag=my-capston-image ."
            }
        }
       
     }    
  }
