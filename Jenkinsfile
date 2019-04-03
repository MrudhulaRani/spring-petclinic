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
        stage('petclinic1 Build') {
            steps {
                sh './mvnw package'
            }
		}
        stage('petclinic1 docker Build') {
            steps {
                sh 'docker build -t vmr-petclinic1 .'
            }
			}
        stage('petclinic1 docker Run') {
            steps {
                sh 'docker run --name vmr-petclinicapp1 -d -p 8091:8080 vmr-petclinic1'
            }
        }
        }
		}
