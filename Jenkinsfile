pipeline {
    agent any
    environment {
        CI = 'true'
        API_DIR = './SampleStore'
        DEV_ENV = 'dev'
        PROD_ENV = 'prod'
        TEST_SCRIPT_FILE = 'sample.store.dev.postman_collection.json'        
    }
    stages {

        stage('Deploy to Dev') {
            environment{
                RETRY = '80'
            }
            steps {
                echo 'Logging into $DEV_ENV'
				sh """
				sudo su - ec2-user <<EOF
				apimcli login dev -u admin -p admin -k
				sleep 5
				cd $WORKSPACE
				apimcli import-api -f $API_DIR -e $DEV_ENV -k --preserve-provider=false --update --verbose
				EOF
				""".stripIndent()

            }
        }
        /* stage('Run Tests') {
            steps {
                echo 'Running tests in $DEV_ENV'
                sh 'newman run $API_DIR/$TEST_SCRIPT_FILE --insecure' 
            }
        } 
        stage('Deploy to Production') {
            environment{
                RETRY = '60'
            }
            steps {
                sh 'echo "Logging into $PROD_ENV"'
                withCredentials([usernamePassword(credentialsId: 'apim_prod', usernameVariable: 'PROD_USERNAME', passwordVariable: 'PROD_PASSWORD')]) {
                    sh 'apimcli login $PROD_ENV -u $PROD_USERNAME -p $PROD_PASSWORD -k'    
					echo 'Deploying to Production'
					sh 'apimcli import-api -f $API_DIR -e $PROD_ENV -k --preserve-provider=false --update --verbose'                    
                }
            }
        } */
    }

}