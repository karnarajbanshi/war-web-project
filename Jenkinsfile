pipeline {
  agent any
  stages {
    stage('BuildApplication') {
      steps {
         sh 'mvn -f pom.xml clean package'
      }
      post {
        success {
            echo "we are archiving the artifact"
            archiveArtifacts artifacts: '**/*.war', followSymlinks: false
        }
      }
    }
    stage('CreateTomcatImage') {
      steps {
        echo "Building docker image"
        sh '''
        original_pwd=$(pwd -P)
        pwd
        docker build -t karnarajbanshi/webappimg:$BUILD_NUMBER . -f Dockerfile
        docker push karnarajbanshi/webappimg:$BUILD_NUMBER # Push the built image to a repository
        cd $original_pwd
        '''
      }
    }
    stage('Deploy in QA instance') {
      steps {
        echo "We are deploying the app"
        sh '''
        docker container stop tomcatlocalinstance || true
        docker container rm tomcatlocalinstance  || true
        docker pull karnarajbanshi/webappimg:$BUILD_NUMBER # Pull the image from the repository
        docker container run -itd --name tomcatlocalinstance -p 8083:8080 karnarajbanshi/webappimg:$BUILD_NUMBER
        '''
      }
    }
    stage('Deploy in Staging instance') {
      steps {
        timeout(time:5, unit:'MINUTES'){
            input message: 'Approve the staging deployment'
        }
        echo "We are deploying the app in staging env"
        sh '''
        docker container stop tomcatstaginginstance || true
        docker container rm tomcatstaginginstance || true
        docker pull karnarajbanshi/webappimg:$BUILD_NUMBER # Pull the image from the repository
        docker container run -itd --name tomcatstaginginstance -p 8084:8080 karnarajbanshi/webappimg:$BUILD_NUMBER
        '''
      }
    }
  }
  post {
    always {
      mail to: 'karnaraj05@gmail.com',
      subject: "Job '${JOB_NAME}' (${BUILD_NUMBER}) is waiting for input",
      body: "Please go to ${BUILD_URL} and verify the build"
    }
    success {
      mail to: 'karnaraj05@gmail.com',
      subject: 'BUILD SUCCESS NOTIFICATION',
      body: """Hi Team,

Build #$BUILD_NUMBER is successful, please go through the URL

$BUILD_URL

and verify the details.

Regards,
DevOps Team"""
    }
    failure {
      mail to: 'karna05@outlook.com',
      subject: 'BUILD FAILED NOTIFICATION',
      body: """Hi Team,

Build #$BUILD_NUMBER is unsuccessful, please go through the URL

$BUILD_URL

and verify the details.

Regards,
DevOps Team"""
    }
  }
}
