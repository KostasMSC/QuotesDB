pipeline {
	environment {
		DBServer = 'ec2-3-127-68-168.eu-central-1.compute.amazonaws.com'
		mysqlImage = "kargyris/mysql"
		registryCredential = 'dockerhub'
		dockerMysqlImage = ''
	}
    agent any
    stages {
        stage ('Git-checkout') {
            steps {
                echo "Checking out from git repository.";
            }
        }
		stage('Building Tomcat image') {
		  steps{
		    script {
		      dockerMysqlImage = docker.build mysqlImage
		    }
		  }
		}
		stage('Push Docker Image to Dockerhub') {
		  steps{
		     script {
		        docker.withRegistry( '', registryCredential ) {
		        dockerMysqlImage.push()
		      }
		    }
		  }
		}
		stage('Remove Unused Docker image') {
		  steps{
		    sh "docker rmi -f $mysqlImage"
		  }
		}
		stage('Deploy docker image from Dockerhub To Production Server') {
		  steps{
			script {
			        try {
            		    sh "sudo ssh -o StrictHostKeyChecking=no -oIdentityFile=/home/ubuntu/.ssh/FinalJenkins2.pem ubuntu@$DBServer \'sudo docker stop \$(sudo docker ps -a -q) || true && sudo docker rm \$(sudo docker ps -a -q) || true\'"

			        }
			        catch (exc) {
			            echo "Error while removing images, continue..., cause: " + exc;
			        }
			    }

		    sh "sudo ssh -o StrictHostKeyChecking=no -oIdentityFile=/home/ubuntu/.ssh/FinalJenkins2.pem ubuntu@$DBServer \'sudo docker run -d -p 3306:3306 $mysqlImage\'"
		  }
		}
    }
    post {
        always {
            echo "Always execute this."
        }
        success  {
            echo "Execute when run is successful."
        }
        failure  {
            echo "Execute run results in failure."
        }
        unstable {
            echo "Execute when run was marked as unstable."
        }
        changed {
            echo "Execute when state of pipeline changed (failed <-> successful)."
        }
    }
}