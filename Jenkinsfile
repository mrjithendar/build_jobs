pipeline {

    agent any

    stages {
        stage('Build Microservice for Boutique App') {
            steps {
                // parallel steps and stages executes multiples steps or stages at a time
                parallel(
                  mongodb: {
                    build 'microservices/mongodb_service'
                  },
                  shipping: {
                    build 'microservices/shipping_service'
                  },
                  cart: {
                    build 'microservices/cart_service'
                  },
                  catalogue: {
                    build 'microservices/catalogue_service'
                  },
                  payment: {
                    build 'microservices/payment_service'
                  },
                  rabbitmq: {
                    build 'microservices/rabbitmq_service'
                  },
                  user: {
                    build 'microservices/user_service'
                  },
                  frontend: {
                    build 'microservices/frontend_service'
                  },
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
