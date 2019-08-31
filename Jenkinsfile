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
    stage('Build') {
      environment {
        UNITY_PATH = '/opt/Unity/Editor/Unity'
        UNITY_ARGS = '-batchmode -quit -disable-assembly-updater -nographics -projectPath . -executeMethod RoaringFangs.Editor.BuildManager.Build'
        BUILD_METHOD_ARGS = '-cleanedLogFile Build/log.txt'
      }
      parallel {
        stage('Win64 Development') {
          steps {
            sh '''
 
$UNITY_PATH $UNITY_ARGS  -platform Win64 -configuration Development $BUILD_METHOD_ARGS'''
          }
        }
        stage('Win64 DevRelease') {
          steps {
            sh '''
 
$UNITY_PATH $UNITY_ARGS  -platform Win64 -configuration DevRelease $BUILD_METHOD_ARGS'''
          }
        }
        stage('Mac Development') {
          steps {
            sh '''
 
$UNITY_PATH $UNITY_ARGS  -platform Mac -configuration Development $BUILD_METHOD_ARGS'''
          }
        }
        stage('') {
          steps {
            sh '''
 
$UNITY_PATH $UNITY_ARGS  -platform Mac -configuration DevRelease $BUILD_METHOD_ARGS'''
          }
        }
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