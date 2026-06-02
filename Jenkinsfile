pipeline {
agent any

```
environment {
    IMAGE_NAME = "web"
    IMAGE_TAG = "latest"
    CONTAINER_NAME = "web"
}

stages {

    stage('Checkout') {
        steps {
            git branch: 'main',
                url: 'https://github.com/Amit9031/web.git'
        }
    }

    stage('Build Docker Image') {
        steps {
            sh 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .'
        }
    }

    stage('Deploy Container') {
        steps {
            sh '''
            docker stop ${CONTAINER_NAME} || true
            docker rm ${CONTAINER_NAME} || true

            docker run -d \
                --name ${CONTAINER_NAME} \
                -p 1010:80 \
                ${IMAGE_NAME}:${IMAGE_TAG}
            '''
        }
    }

    stage('Verify Deployment') {
        steps {
            sh 'docker ps'
        }
    }
}

post {
    success {
        echo 'Application deployed successfully!'
    }

    failure {
        echo 'Pipeline failed!'
    }
}

}
