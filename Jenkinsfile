pipeline {
    agent none
    stages {
        stage('Build') {
            parallel {

                stage('Linux - Swift 4.2.4') {
                    agent {
                        docker { image 'swift:4.2.4' }
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

                stage('MacOS - Swift 4.2.4') {
                    agent {
                        label 'MacOS'
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
            }
        }
    }
}
