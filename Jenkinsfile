pipeline {
  agent any
  stages {
    stage('Setup for Build') {
      steps {
        sh 'mkdir -p Build'
      }
    }
    stage('Build') {
      environment {
        UNITY_COMMAND = '/opt/Unity/Editor/Unity -batchmode -quit -disable-assembly-updater -nographics -projectPath . -executeMethod RoaringFangs.Editor.BuildManager.Build'
        BUILD_METHOD_ARGS = '-cleanedLogFile Build/log.txt'
      }
      parallel {
        stage('Win64 Development') {
          agent {
            docker {
              registryUrl 'http://registry:5000'
              image 'registry:5000/unity-docker'
              args '--privileged -v $WORKSPACE/Build:$WORKSPACE/Build:z -v /opt/Unity:/opt/Unity -v /root/.local/share/unity3d:/root/.local/share/unity3d'
            }

          }
          when {
            expression {
              params.Win64Development
            }

          }
          steps {
            sh '''
 
$UNITY_COMMAND  -platform Win64 -configuration Development $BUILD_METHOD_ARGS'''
            echo 'TODO: Tests'
            archiveArtifacts 'Build/**'
          }
        }
        stage('Mac Development') {
          agent {
            docker {
              registryUrl 'http://registry:5000'
              image 'registry:5000/unity-docker'
              args '--privileged -v $WORKSPACE/Build:$WORKSPACE/Build:z -v /opt/Unity:/opt/Unity -v /root/.local/share/unity3d:/root/.local/share/unity3d'
            }

          }
          when {
            expression {
              params.MacDevelopment
            }

          }
          steps {
            sh '''
 
$UNITY_COMMAND  -platform Mac -configuration Development $BUILD_METHOD_ARGS'''
            echo 'TODO: Tests'
            archiveArtifacts 'Build/**'
          }
        }
      }
    }
  }
  parameters {
    booleanParam(defaultValue: true, description: 'Build Win64 Development', name: 'Win64Development')
    booleanParam(defaultValue: true, description: 'Build Win64 DevRelease', name: 'Win64DevRelease')
    booleanParam(defaultValue: true, description: 'Build Mac Development', name: 'MacDevelopment')
    booleanParam(defaultValue: true, description: 'Build Mac DevRelease', name: 'MacDevRelease')
  }
}