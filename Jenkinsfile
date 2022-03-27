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
      DOCKER_FILE_NAME = 'Dockerfile.tiny'
      TOKEN = 'github-token'
  }
  stages {
    def app
    stage('Cloning Git') {
      checkout scm
    }
    stage('Building image') {
      app = docker.build("${env.APP_NAME}", "-f ${env.DOCKER_FILE_NAME} ./")
    }
    stage('Docker Run') {
      app.withRun("docker run -d --name ${env.APP_NAME} --restart=unless-stopped -p ${env.APP_PORT}:${env.APP_PORT} ${env.APP_NAME}")
    }
  }
}
