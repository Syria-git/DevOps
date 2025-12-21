pipeline {
    agent any // يبدأ التنفيذ على الماستر لتهيئة الحاوية

    environment {
        AGENT_IMAGE = "my-project-builder:${env.BUILD_NUMBER}"
        CONTAINER_NAME = "agent-worker-${env.BUILD_NUMBER}"
    }

    stages {
        stage('Build Agent Image') {
            steps {
                echo 'Building the dedicated agent image...'
                // بناء الصورة من Dockerfile موجود في نفس مشروعك
                sh "docker build --network=host -t ${AGENT_IMAGE} ."
            }
        }

        stage('Run Dynamic Agent') {
            steps {
                echo 'Starting the agent container...'
                
// تشغيل الحاوية وتمرير مجلد المشروع لها
sh """
        docker run -d --name ${CONTAINER_NAME} \
        --network host \
        -e http_proxy=http://10.0.68.19:8080 \
        -e https_proxy=http://10.0.68.19:8080 \
        -v /var/www/html:/var/www/html \
        -v ${WORKSPACE}:/app -w /app ${AGENT_IMAGE} sleep 300
        """              
            }
        }

        stage('Execute Tasks Inside Agent') {
            steps {
        // إنشاء المجلد داخل المسار المربوط (الذي يشير للسيرفر الحقيقي)
        sh "docker exec ${CONTAINER_NAME} mkdir -p /var/www/html/convert"
        
        // نسخ الملفات من مجلد العمل /app إلى المجلد المستهدف
        sh "docker exec ${CONTAINER_NAME} cp -r . /var/www/html/convert/"
        
        echo "Deployment successful to http://10.0.68.94/convert/"
    }
        }
    }

    post {
        always {
            echo 'Cleaning up: Stopping and removing the agent container...'
            sh "docker stop ${CONTAINER_NAME} || true"
            sh "docker rm ${CONTAINER_NAME} || true"
            // اختياري: حذف الصورة لتوفير المساحة
            sh "docker rmi ${AGENT_IMAGE} || true"
        }
    }
}
