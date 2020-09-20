FROM richxsl/rhel7
RUN  yum install httpd php php-mysql php-gd mariadb-server php-xml php-intl mysql
RUN  systemctl restart httpd.service ; systemctl enable httpd.service
RUN  systemctl start mariadb ; systemctl enable mariadb
RUN  mysql -u root -p
RUN  yum install wget
RUN  wget https://releases.wikimedia.org/mediawiki/1.24/mediawiki-1.24.2.tar.gz
RUN  tar -zxpvf mediawiki-1.24.2.tar.gz
RUN  mv mediawiki-1.24.2 /var/www/html/mediawiki
RUN  chown -R apache:apache /var/www/html/mediawiki/
RUN  chmod 755 /var/www/html/mediawiki/
RUN  yum install firewalld
RUN  systemctl start firewalld
RUN  systemctl enable firewalld
RUN  firewall-cmd --zone=public --add-port=80/tcp --permanent
RUN  iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT
RUN  iptables -I INPUT -p tcp -m tcp --dport 443 -j ACCEPT
RUN  getenforce
RUN  restorecon -FR /var/www/html/mediawiki/


