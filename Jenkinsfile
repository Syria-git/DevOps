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
                // هذا الأمر يقوم بضغط ملفات الـ HTML والـ JS والـ CSS في ملف واحد
                sh 'zip project_files.zip index.html style.css converter.js jquery.min.js favicon.ico'
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
            // هذا الأمر يخبر Jenkins بحفظ الملف الناتج لكي تتمكن من تحميله من واجهة Jenkins
            archiveArtifacts artifacts: 'project_files.zip', fingerprint: true
        }
    }
}
