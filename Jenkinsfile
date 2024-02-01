pipeline{

    agent any


    stages{

        stage("Git Checkout"){

            steps{
                git branch: 'main', url: 'https://github.com/Sangram0105/Jenkins-Docker-integration.git'
            }

        }
            stage("Unit Testing"){

            steps{
               script{
                    bat 'mvn test'
               }
            }

        }

          stage("Integration testing"){

            steps{
               script{
                     bat 'mvn verify -DskipUnitTests'
               }
            }

        }

         stage('Maven build'){

            steps{

                script{

                    bat 'mvn clean install'
                }
            }
        }

               stage('Static code analysis'){

            steps{

                script{

                    withSonarQubeEnv(credentialsId: 'sonarQube-api') {

                        bat 'mvn clean package sonar:sonar'
                    }
                   }

                }
            }
            stage('Quality Gate Status'){

                steps{

                    script{

                        waitForQualityGate abortPipeline: false, credentialsId: 'sonarQube-api'
                    }
                }
            }
        }

    }



