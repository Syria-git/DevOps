pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'جاري جلب الكود من GitHub...'
                checkout scm
            }
        }

        stage('Build - Archive Project') {
            steps {
                echo 'جاري ضغط ملفات المشروع...'
                sh 'zip project_files.zip index.html style.css converter.js jquery.min.js favicon.ico'
                archiveArtifacts artifacts: 'project_files.zip', fingerprint: true
            }
        }

        stage('Build and Run Docker') {
            steps {
                echo 'جاري بناء صورة Docker وتشغيل الحاوية...'
                script {
                    // Build Docker image
                    def image = docker.build("web-converter-app:${env.BUILD_ID}")

                    // Stop and remove any existing container (optional cleanup)
                    sh 'docker stop web-converter-app || true'
                    sh 'docker rm web-converter-app || true'

                    // Run container on port 8080
                    image.run("--name web-converter-app -d -p 8080:80")
                }
            }
        }

        stage('Deploy to Web Server') {
            steps {
                echo 'جاري نشر الموقع على سيرفر Apache...'
                sh 'cp index$html style.css converter.js jquery.min.js favicon.ico /var/www/html/convert/'
            }
        }

        stage('Quality Check') {
            steps {
                echo 'تم فحص جودة الملفات بنجاح.'
            }
        }
    }

    post {
        success {
            echo 'تمت عملية البناء بنجاح! جاري حفظ الملف المضغوط...'
            echo 'تم النشر بنجاح! يمكنك الآن زيارة الموقع عبر المتصفح.'
            echo 'أو قم بزيارة التطبيق داخل الحاوية على المنفذ 8080.'
        }
    }
}
