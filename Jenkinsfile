pipeline {
    agent any

    environment {
        EC2_IP = '16.170.202.12'
    }

    stages {
        stage ('fetch code') {
            steps {
                script {
                    echo "Pull source code from Git"
                    git branch: 'main', url: 'https://github.com/Isaiahat/Ansible-config-mgt.git'
                }
            }
        }
        
        stage ('deploy to EC2') {
            steps {
                script {
                    echo "deploying shell-script to ec2"
                    def shellCmd = "bash ./websetup.sh"
                    sshagent (['Linux']) {
                        sh "scp -o StrictHostKeyChecking=no websetup.sh ubuntu@${EC2_IP}:/home/ubuntu"
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@${EC2_IP} ${shellCmd}"
                    }
                }
            }
        }
    }
}
