pipeline {
  agent {
    docker {
      registryUrl 'http://registry:5000'
      image 'registry:5000/unity-docker'
      args '--privileged -v /opt/Unity:/opt/Unity -v /root/.local/share/unity3d:/root/.local/share/unity3d'
    }

  }
  stages {
    stage('Setup for Build') {
      steps {
        sh 'mkdir -p Build'
      }
    }
    stage('Win64 Development') {
      steps {
        sh '''
 
$UNITY_PATH $UNITY_ARGS  -platform Win64 -configuration Development $BUILD_METHOD_ARGS'''
      }
    }
    stage('Test') {
      steps {
        echo 'Testing is TODO'
      }
    }
    stage('Archive') {
      steps {
        archiveArtifacts(artifacts: 'Build', onlyIfSuccessful: true)
      }
    }
  }
}