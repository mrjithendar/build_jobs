pipeline {

    agent any

    stages {
        stage('Build Microservice for Boutique App') {
            steps {
                parallel(
                  a: {
                    echo "This is branch a"
                  },
                  b: {
                    echo "This is branch b"
                  }
                )
                // build 'boutique_project/ad_service'
                // build 'boutique_project/cart_service'
                // build 'boutique_project/checkout_service'
                // build 'boutique_project/currency_service'
                // build 'boutique_project/email_service'
                // build 'boutique_project/frontend_service'
                // build 'boutique_project/load_generator'
                // build 'boutique_project/payment_service'
                // build 'boutique_project/product_catalog_service'
                // build 'boutique_project/recommendation_service'
                // build 'boutique_project/shipping_service'
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
