pipeline {
    agent none
    stages {
        stage('Linux - Swift 4.2.4') {
            agent {
                docker { image 'swift:4.2.4' }
            }
            steps {
                checkout scm
                sh 'swift build'
                sh 'swift test'
            }
            post {
                always {
                    sh 'Archive unit tests.'
                }
            }
        }
        stage('MacOS') {
            agent {
                label 'MacOS'
            }
            steps {
              checkout scm
              sh 'swift build'
              sh 'swift test'
            }
            post {
                always {
                    sh "junit '**/target/*.xml'"
                }
            }
        }
    }
}
