pipeline {
    agent any

    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
        timestamps()
    }

    stages {
        stage('Checkout Info') {
            steps {
                echo "Branch: ${env.BRANCH_NAME}"
                sh 'git log -1 --oneline'
            }
        }
        stage('Build') {
            steps {
                sh 'chmod +x build.sh && ./build.sh'
            }
        }
        stage('Test') {
            steps {
                sh 'python3 test_app.py'
            }
        }
        stage('Deploy') {
            when { branch 'main' }
            steps {
                echo 'Deploying (main branch only)...'
            }
        }
    }

    post {
        success { echo "Build succeeded on ${env.BRANCH_NAME}" }
        failure { echo "Build failed on ${env.BRANCH_NAME}" }
    }
}
