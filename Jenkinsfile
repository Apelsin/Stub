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
      }
      parallel {
        stage('Win64 Development') {
          agent {
            docker {
              registryUrl 'http://registry:5000'
              image 'registry:5000/unity-docker'
              args '--privileged -v /opt/Unity:/opt/Unity -v /root/.local/share/unity3d:/root/.local/share/unity3d'
            }

          }
          when {
            expression {
              params.Win64Development
            }

          }
          steps {
            sh '''
$UNITY_COMMAND -platform Win64 -configuration Development -buildPath Win64-Development'''
            echo 'TODO: Tests'
            archiveArtifacts 'Win64-Development/**'
          }
        }
        stage('Win64 DevRelease') {
          agent {
            docker {
              registryUrl 'http://registry:5000'
              image 'registry:5000/unity-docker'
              args '--privileged -v /opt/Unity:/opt/Unity -v /root/.local/share/unity3d:/root/.local/share/unity3d'
            }

          }
          when {
            expression {
              params.Win64DevRelease
            }

          }
          steps {
            sh '''
$UNITY_COMMAND -platform Win64 -configuration DevRelease -buildPath Win64-DevRelease'''
            echo 'TODO: Tests'
            archiveArtifacts 'Win64-DevRelease/**'
          }
        }
        stage('Win64 Release') {
          agent {
            docker {
              registryUrl 'http://registry:5000'
              image 'registry:5000/unity-docker'
              args '--privileged -v /opt/Unity:/opt/Unity -v /root/.local/share/unity3d:/root/.local/share/unity3d'
            }

          }
          when {
            expression {
              params.Win64Release
            }

          }
          steps {
            sh '''
$UNITY_COMMAND -platform Win64 -configuration Release -buildPath Win64-Release'''
            echo 'TODO: Tests'
            archiveArtifacts 'Win64-Release/**'
          }
        }
        stage('Mac Development') {
          agent {
            docker {
              registryUrl 'http://registry:5000'
              image 'registry:5000/unity-docker'
              args '--privileged -v /opt/Unity:/opt/Unity -v /root/.local/share/unity3d:/root/.local/share/unity3d'
            }

          }
          when {
            expression {
              params.MacDevelopment
            }

          }
          steps {
            sh '''
$UNITY_COMMAND  -platform Mac -configuration Development -buildPath Mac-Development'''
            echo 'TODO: Tests'
            archiveArtifacts 'Mac-Development/**'
          }
        }
        stage('Mac DevRelease') {
          agent {
            docker {
              registryUrl 'http://registry:5000'
              image 'registry:5000/unity-docker'
              args '--privileged -v /opt/Unity:/opt/Unity -v /root/.local/share/unity3d:/root/.local/share/unity3d'
            }

          }
          when {
            expression {
              params.MacDevRelease
            }

          }
          steps {
            sh '''
$UNITY_COMMAND  -platform Mac -configuration DevRelease -buildPath Mac-DevRlease'''
            echo 'TODO: Tests'
            archiveArtifacts 'Mac-DevRelease/**'
          }
        }
        stage('Mac Release') {
          agent {
            docker {
              registryUrl 'http://registry:5000'
              image 'registry:5000/unity-docker'
              args '--privileged -v /opt/Unity:/opt/Unity -v /root/.local/share/unity3d:/root/.local/share/unity3d'
            }

          }
          when {
            expression {
              params.MacRelease
            }

          }
          steps {
            sh '''
$UNITY_COMMAND  -platform Mac -configuration Release -buildPath Mac-Release'''
            echo 'TODO: Tests'
            archiveArtifacts 'Mac-Release/**'
          }
        }
      }
    }
  }
  parameters {
    booleanParam(defaultValue: true, description: 'Build Win64 Development', name: 'Win64Development')
    booleanParam(defaultValue: true, description: 'Build Win64 DevRelease', name: 'Win64DevRelease')
    booleanParam(defaultValue: true, description: 'Build Win64 Release', name: 'Win64Release')
    booleanParam(defaultValue: true, description: 'Build Mac Development', name: 'MacDevelopment')
    booleanParam(defaultValue: true, description: 'Build Mac DevRelease', name: 'MacDevRelease')
    booleanParam(defaultValue: true, description: 'Build Mac Release', name: 'MacRelease')
  }
}