pipeline {
    agent any
    tools {
        maven 'Maven 3.x' // Assurez-vous que Maven est installé et configuré dans Jenkins Ok
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/idrissa010/ProjetVideothequeJEE.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying application...'
                // Ajoutez ici des étapes spécifiques pour déployer votre application
            }
        }
    }
}
