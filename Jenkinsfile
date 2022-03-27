node {
  def APP_NAME = 'angular-adv'
  // env {
  //     // APP_NAME = 'angular-adv'
  //     DOMAINE = 'mohamed-mourabit.com'
  //     DOMAINE_PREFIX = ''
  //     SUB_DOMAINE = 'angular'
  //     APP_PORT = '4000'

  //     GIT_REPO = 'djm2x/angular-adv'
  //     BRANCH = 'main'
  //     DOCKER_FILE_NAME = 'Dockerfile.tiny'
  //     TOKEN = 'github-token'
  // }


    def app
    stage('Cloning Git') {
      checkout scm
    }
    stage('Building image') {
      app = docker.build("angular-adv", "-f Dockerfile.tiny ./")
    }
    stage('Docker Run') {
      // env.setProperty(APP_NAME = 'angular-adv2')

      sh "echo ${APP_NAME}"
      // sh "echo ${DOMAINE}"
      sh "docker run -d --name angular-adv --restart=unless-stopped -p 4000:4000 angular-adv"
    }
}

