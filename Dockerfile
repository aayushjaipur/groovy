FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd zip unzip wget -y
WORKDIR /var/www/html
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/carvilla.zip
RUN unzip carvilla.zip
RUN rm -rf carvilla.zip &&\ 
    cp -rf carvilla-v1.0/* . &&\ 
    rm -rf carvilla-v1.0 
EXPOSE 80
cmd ["/usr/sbin/httpd", "-D", "FOREGROUND"]
