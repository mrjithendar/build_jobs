pipeline {

    agent any

    stages {
        stage('Build Microservice for Boutique App') {
            steps {
                // parallel steps and stages executes multiples steps or stages at a time
                parallel(
                  frontend_service: {
                    build 'boutique_project/frontend_service'
                  },
                  email_service: {
                    build 'boutique_project/email_service'
                  },
                  ad_service: {
                    build 'boutique_project/ad_service'
                  },
                  cart_service: {
                    build 'boutique_project/cart_service'
                  },
                  checkout_service: {
                    build 'boutique_project/checkout_service'
                  },
                  currency_service: {
                    build 'boutique_project/currency_service'
                  },
                  load_generator: {
                    build 'boutique_project/load_generator'
                  },
                  payment_service: {
                    build 'boutique_project/payment_service'
                  },
                  catalog_service: {
                    build 'boutique_project/product_catalog_service'
                  },
                  recommendation_service: {
                    build 'boutique_project/recommendation_service'
                  },
                  shipping_service: {
                    build 'boutique_project/shipping_service'
                  }
                )
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
