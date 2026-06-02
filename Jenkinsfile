pipeline {
agent any


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

    stage('Build') {
        steps {
            sh 'docker build -t web:latest .'
        }
    }

    stage('Deploy') {
        steps {
            sh '''
            docker stop web || true
            docker rm web || true

            docker run -d \
                --name web \
                -p 1010:80 \
                web:latest
            '''
        }
    }

    stage('Verify') {
        steps {
            sh 'docker ps'
        }
    }
}

post {
    success {
        echo 'Deployment Successful!'
    }

    failure {
        echo 'Deployment Failed!'
    }
}


}
