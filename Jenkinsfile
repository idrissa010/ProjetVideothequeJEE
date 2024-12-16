pipeline {
    agent any

    environment {
        MAVEN_HOME = '/opt/apache-maven-3.9.9'  // Spécifie le chemin de Maven
        PATH = "${MAVEN_HOME}/bin:${PATH}"      // Ajoute Maven au PATH
    }

    stages {
        // Étape de vérification de la version de Maven pour s'assurer qu'il est disponible
        stage('Check Maven') {
            steps {
                sh 'mvn -v'  // Affiche la version de Maven pour vérifier qu'il est correctement installé
            }
        }

        // Étape de clonage du dépôt Git
        stage('Checkout') {
            steps {
                git 'https://github.com/idrissa010/ProjetVideothequeJEE.git'
            }
        }

        // Étape de construction du projet avec Maven
        stage('Build') {
            steps {
                dir('ProjetVideotheque') {  // Assurez-vous que ce dossier existe et contient le fichier pom.xml
                    sh 'mvn clean install'  // Exécute Maven pour nettoyer et installer le projet
                }
            }
        }

        // Étape de test (si applicable)
        stage('Test') {
            steps {
                dir('ProjetVideotheque') {  // Remplacez 'ProjetVideotheque' par le bon répertoire
                    sh 'mvn test'  // Lance les tests si vous en avez configuré dans votre projet
                }
            }
        }
    }

    post {
        success {
            echo 'Le build a réussi!'
        }
        failure {
            echo 'Le build a échoué.'
        }
    }
}
