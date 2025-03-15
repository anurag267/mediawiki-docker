FROM centos:7
RUN yum install -y httpd php php-mysql php-gd mariadb-server php-xml php-intl mysql wget firewalld \
    && systemctl enable httpd.service mariadb firewalld \
    && wget https://releases.wikimedia.org/mediawiki/1.24/mediawiki-1.24.2.tar.gz \
    && tar -zxpvf mediawiki-1.24.2.tar.gz \
    && mv mediawiki-1.24.2 /var/www/html/mediawiki \
    && chown -R apache:apache /var/www/html/mediawiki/ \
    && chmod -R 750 /var/www/html/mediawiki/
EXPOSE 80
CMD ["/usr/sbin/init"]
