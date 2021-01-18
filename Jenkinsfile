properties([pipelineTriggers([githubPush()])])

pipeline {
    agent { 
      docker {
        image 'hashicorp/terraform'
        args  '--entrypoint='
      }
    }

    options {
      withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-key', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
    }

    environment {
      AWS_REGION = "eu-west-3"
    }
    
    stages {
      stage('init') {
        steps {
          sh 'terraform init'
        }
      }
      stage('plan') {
        steps {
          sh 'terraform plan'
        }
      }
      stage('apply') {
        steps {
          sh 'terraform apply -auto-approve'
        }
      }
    }
}
