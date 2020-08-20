pipeline {
     environment {
	    registry = "shimaa96"
        dockerVersion = 'latest'
	    dockerImage = 'capston-image'
     }
     agent any
     stages {
        
         stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }
         stage("Lint Dockerfile") {
			steps {
				sh "docker run --rm -i hadolint/hadolint < Dockerfile"
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
        stage('Deploy infrastructure') {
            steps {
                withAWS(credentials: 'aws-access', region: 'us-east-1') {
 
                    sh './cloudformation/create.sh K8sCapstoneStack2 cloudformation/K8s_infrastructure.yml cloudformation/infra_parameters.json'
                 
                }
            }
        }

        stage('K8S Deployment') {
            steps {
                
                        sh'./kubernetes/run-kubernetes.sh'
                
                      
            }
       }
    
       
     }    
  }
