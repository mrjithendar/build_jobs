pipeline {

    agent any

    stages {
        stage('Deploy Roboshop Dependencies') {
            steps {
                // parallel steps and stages executes multiples steps or stages at a time
                parallel(
                  mongodb: {
                    build 'microservices/mongodb_service'
                  },
                  rabbitmq: {
                    build 'microservices/rabbitmq_service'
                  },
                  mysql: {
                    build 'microservices/mysql_service'
                  },
                  mysql: {
                    build 'microservices/redis_service'
                  },
                )
            }
        }
        stage('Build and Deploy Microservice') {
            steps {
                // parallel steps and stages executes multiples steps or stages at a time
                parallel(
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
