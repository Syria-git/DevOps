# استخدم صورة nginx الرسمية كخادم ويب خفيف
FROM nginx:alpine

# احذف الملفات الافتراضية لـ nginx
RUN rm -rf /usr/share/nginx/html/*

# انسخ ملفات موقعك إلى مجلد الخدمة
COPY index.html style.css converter.js jquery.min.js favicon.ico /usr/share/nginx/html/

# المنفذ الافتراضي لـ nginx هو 80
EXPOSE 80
