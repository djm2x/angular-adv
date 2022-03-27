#!groovy

node {
  def APP_NAME = 'angular-adv'
  def DOMAINE = 'mohamed-mourabit.com'
  def DOMAINE_PREFIX = ''
  def SUB_DOMAINE = 'angular'
  def APP_PORT = '4000'

  def DOCKER_FILE_NAME = 'Dockerfile'

  def app

    stage('Cloning Git') {
      def commit = checkout scm
      //  env.BRANCH_NAME = commit.GIT_BRANCH.replace('origin/', '')
      // sh "echo ${commit}"
    }

    stage('Building image') {
      app = docker.build("${APP_NAME}", "-t ${env.APP_NAME} -f ${DOCKER_FILE_NAME} ./")

      // sh "echo ${app}"
    }

    stage('Docker Run') {
      sh "docker rm --force ${APP_NAME}"
      // sh "docker rmi --force ${APP_NAME}"
      // sh "docker run -d --name angular-adv --restart=unless-stopped -p 4000:4000 angular-adv"

      sh """docker run -d \
      --restart unless-stopped \
      --network proxy \
      --label traefik.enable=true \
      --label traefik.http.routers.${APP_NAME}.tls=true \
      --label traefik.http.routers.${APP_NAME}.tls.certresolver=letsencrypt \
      --label traefik.http.routers.${APP_NAME}.rule='Host(`${SUB_DOMAINE}.${DOMAINE}`)' \
      --label traefik.http.services.${APP_NAME}.loadbalancer.server.port=${APP_PORT} \
      --name ${APP_NAME} \
      ${APP_NAME}"""
    }
}

