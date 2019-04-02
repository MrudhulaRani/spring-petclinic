pipeline {
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
        stage('petclinic docker Build') {
            steps {
                sh 'docker build -t vmr-petclinic .'
            }
        stage('petclinic docker Run') {
            steps {
                sh 'docker run --name petclinicapp2 -p 8091:8080 vmr-petclinic'
            }
        }
    }