pipeline {
  agent {
    docker {
      registryUrl 'http://registry:5000'
      image 'registry:5000/unity-docker'
      args '--privileged -v /opt/Unity:/opt/Unity -v /root/.local/share/unity3d:/root/.local/share/unity3d'
    }

  }
  stages {
    stage('Build the stuff!') {
      steps {
        sh '''
mkdir -p Build; /opt/Unity/Editor/Unity -batchmode -disable-assembly-updater -nographics -projectPath . -executeMethod RoaringFangs.Editor.BuildManager.Build -platform Win64 -configuration development -cleanedLogFile Build/log.txt'''
      }
    }
  }
}