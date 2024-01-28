pipeline {

    agent any

    stages {
        stage('Build Microservice for Boutique App') {
            steps {
                build 'boutique_project/ad_service'
                build 'boutique_project/cart_service'
            }
        }
    }
    options {
        preserveStashes()
        timestamps()
    }
    post {
        always {
            cleanWs()
        }
    }
}
