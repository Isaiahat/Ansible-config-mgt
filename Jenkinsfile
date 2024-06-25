pipeline {
    agent any

    environment {
        EC2_IP = '13.60.2.176'
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
                    sshagent (['Linux-pem']) {
                        sh "scp -o StrictHostKeyChecking=no websetup.sh ec2-user@${EC2_IP}:/home/ec2-user"
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@${EC2_IP} ${shellCmd}"
                    }
                }
            }
        }
    }
}