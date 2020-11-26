pipeline {
    agent none
    stages {
        stage('Build') {
            parallel {

                stage('Linux - Swift 4.2') {
                    agent {
                        docker { image 'swift:4.2' }
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

                stage('Linux - Swift 5.1') {
                    agent {
                        docker { image 'swift:5.1' }
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
                        stage('SwiftEnv') {
                            steps {
                                sh 'swiftenv local 4.2.4'
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

                stage('MacOS - Swift 5.1.4') {
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
                                sh 'swiftenv local 5.1.4'
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

                stage('MacOS - Swift 5.3.1') {
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
                                sh 'swiftenv local 5.3.1'
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
