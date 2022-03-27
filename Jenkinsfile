#!groovy

pipeline {
  agent none
  environment {
      APP_NAME = 'angular-adv'
      DOMAINE = 'mohamed-mourabit.com'
      DOMAINE_PREFIX = ''
      SUB_DOMAINE = 'angular'
      APP_PORT = '4000'

      GIT_REPO = 'djm2x/angular-adv'
      BRANCH = 'main'
      TOKEN = 'github-token'
  }
  stages {
    // stage('Cloning Git') {
    //   steps {
    //     git([url: "https://github.com/${env.GIT_REPO}.git", branch: "${env.BRANCH}", credentialsId: "${env.TOKEN}"])

    //   }
    //   checkout scm
    // }
    stage('Building image') {
      steps{
          checkout scm
          docker.build("angular-adv2", "-f Dockerfile.tiny ./")
      }
    }

  }
}

// pipeline {

//   agent { label 'docker-build-slave' }

//   environment {
//     IMAGE = 'registry.gitlab.com/XXXXX/bible-server'
//     DOCKER_REGISTRY_CREDENTIALS = credentials('DOCKER_REGISTRY_CREDENTIALS')
//   }

//   options {
//     timeout(10)
//   }

//   stages {

//     stage('Test') {
//       steps {
//         sh 'yarn'
//         sh 'npm test'
//       }
//     }

//     stage('Build') {
//       when {
//         branch '*/master'
//       }
//       steps {
//         sh 'docker login -u ${DOCKER_REGISTRY_CREDENTIALS_USR} -p ${DOCKER_REGISTRY_CREDENTIALS_PSW} registry.gitlab.com'
//         sh 'docker build -t ${IMAGE}:${BRANCH_NAME} .'
//         sh 'docker push ${IMAGE}:${BRANCH_NAME}'
//       }
//     }

//     stage('Deploy') {
//       when {
//         branch '*/master'
//       }
//       steps {
//         echo 'Deploying ..'
//       }
//     }
//   }

//   post {
//     success {
//       mail to: "XXXXX@gmail.com", subject:"SUCCESS: ${currentBuild.fullDisplayName}", body: "Yay, we passed."
//     }
//     failure {
//       mail to: "XXXXX@gmail.com", subject:"FAILURE: ${currentBuild.fullDisplayName}", body: "Boo, we failed."
//     }
//   }
// }
