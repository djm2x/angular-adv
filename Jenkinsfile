#!groovy

node {
  def APP_NAME = 'angular-adv'
  def DOMAINE = 'mohamed-mourabit.com'
  def DOMAINE_PREFIX = ''
  def SUB_DOMAINE = 'angular'
  def APP_PORT = '4000'

  def DOCKER_FILE_NAME = 'Dockerfile.tiny'

  def app

    stage('Cloning Git') {
      def commit = checkout scm

      sh "echo ${commit}"
    }

    stage('Building image') {
      app = docker.build("angular-adv", "-f ${DOCKER_FILE_NAME} ./")

      sh "echo ${app}"
    }

    stage('Docker Run') {
      sh "docker rm --force ${env.APP_NAME}"
      sh "docker rmi --force ${env.APP_NAME}"
      // sh "docker run -d --name angular-adv --restart=unless-stopped -p 4000:4000 angular-adv"

      sudo """docker run -d \
      --restart unless-stopped \
      --network proxy \
      --label traefik.enable=true \
      --label traefik.http.routers.${env.APP_NAME}.tls=true \
      --label traefik.http.routers.${env.APP_NAME}.tls.certresolver=letsencrypt \
      --label traefik.http.routers.${env.APP_NAME}.rule="Host(`"${env.SUB_DOMAINE}"."${env.DOMAINE}"`)" \
      --label traefik.http.services.${env.APP_NAME}.loadbalancer.server.port=${env.APP_PORT} \
      --name ${env.APP_NAME} \
      ${env.APP_NAME}"""
    }
}

