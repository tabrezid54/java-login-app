pipeline {
    agent { label 'my-node' } 
    tools {
        maven 'M3'
    }
    environment {
        imageName = "java-login-app"
        dockerImage = ''
        dockerHubUser = 'tabrezid54'
    }
    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/tabrezid54/java-login-app.git'
            }
        
        }
        stage('Build MVN') {
            steps {
                sh 'mvn clean install'
            }
        
        }
        stage('Create Docker Image') {
            steps {
                script {
                   dockerImage = docker.build("${imageName}" ,"$WORKSPACE")  
                }
            }
        
        }
        stage('Docker Tag') {
            steps {
                sh 'docker tag ${imageName} ${dockerHubUser}/${imageName}'
                
            }
        }
        stage('Push') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
                sh 'docker login -u ${dockerHubUser} -p ${dockerhub}'
            }
                
                sh 'docker push tabrezid54/${imageName}'
            }
        
        }
        stage('Deploy K8 Resources') {
            steps {
                sh 'kubectl create -f $WORKSPCE/kubernetes-manifest/.'
            }
        }
    }
}
