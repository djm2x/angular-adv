node {
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
