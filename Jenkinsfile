pipeline {
    agent none
    stages {
        stage('Build') {
            parallel {
                stage('Linux - Swift 5.3') {
                    agent {
                        docker { image 'swift:5.3' }
                    }
                    stages {
                        stage('SCM') {
                            steps {
                                checkout scm
                            }
                        }
                        stage('Build') {
                            steps {
                                sh 'swift build'
                            }
                        }
                        stage('Test') {
                            steps {
                                sh 'swift test'
                            }
                        }
                    }
                }

                stage('MacOS - Swift 5.3.2') {
                    agent {
                        label 'MacOS'
                    }
                    stages {
                        stage('SCM') {
                            steps {
                                checkout scm
                            }
                        }
                        stage('SwiftEnv') {
                            steps {
                                sh 'swiftenv local 5.3.2'
                            }
                        }
                        stage('Build') {
                            steps {
                                sh 'swift build'
                            }
                        }
                        stage('Test') {
                            steps {
                                sh 'swift test'
                            }
                        }
                    }
                }
            }
        }
    }
}
