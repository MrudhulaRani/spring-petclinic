pipeline {
    agent any
    stages {
  	stage ('Prepare') {
        steps {
            checkout([$class: 'GitSCM', 
                branches: [[name: '*/master']], 
                extensions: [[$class: 'CleanCheckout']], 
                userRemoteConfigs: [[credentialsId: 'git-credentials', url: 'https://github.com/MrudhulaRani/spring-petclinic.git']]
                ])
            }
        }
        stage('petclinic Build') {
            steps {
                sh './mvnw package'
            }
		}
        stage('cleanup docker') {
            steps {
                sh 'docker stop petclinicapp2'
                sh 'docker rm petclinicapp2'
                sh 'docker rmi vmr-petclinic'    
            }
			}
        stage('petclinic docker Build') {
            steps {
                
                sh 'docker build -t vmr-petclinic .'
            }
			}
        stage('petclinic docker Run') {
            steps {
                sh 'docker run --name petclinicapp2 -d -p 8091:8080 vmr-petclinic'
            }
        }
        }
		}
