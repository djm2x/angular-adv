node {
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
    def app
    stage('Cloning Git') {
      checkout scm
    }
    stage('Building image') {
      docker.build("angular-adv", "-f Dockerfile.tiny ./").withRun("docker run -d --name angular-adv --restart=unless-stopped -p 4000:4000 angular-adv")
    }
}

