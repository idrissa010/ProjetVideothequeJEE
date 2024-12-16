pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Cloner le dépôt Git
                git 'https://github.com/idrissa010/ProjetVideothequeJEE.git'
            }
        }

        stage('Build') {
            steps {
                // Exécuter Maven pour nettoyer et installer le projet
                sh 'mvn clean install'
            }
        }
    }
}
