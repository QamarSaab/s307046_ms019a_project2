FROM httpd:2.4

MAINTAINER s307046@studssh.cs.hioa.no

# Create 'me' group whith gid 1000 and 'me' user in this group with uid 1000
RUN groupadd -f -g 1000 me && useradd -u 1000 -g me me

RUN [ -d /var/log/httpd ] || mkdir /var/log/httpd
RUN [ -d /var/run/httpd ] || mkdir /var/run/httpd
RUN [ -d /var/lock/httpd ] || mkdir /var/lock/httpd

RUN sed -i.orig 's/#ServerName/ServerName/' /etc/httpd/conf/httpd.conf

ENV APACHE_RUN_USER apache
ENV APACHE_RUN_GROUP apache
ENV APACHE_LOG_DIR /var/log/httpd
ENV APACHE_LOCK_DIR /var/lock/httpd
ENV APACHE_RUN_DIR /var/run/httpd
ENV APACHE_PID_FILE /var/run/httpd/httpd.pid


# Define apache listen port on a port greater than 1024 to allow a non-root user (me) to start apache
RUN sed -i 's/Listen\ 80/Listen\ 1080/g' /usr/local/apache2/conf/httpd.conf

# Allow apache to run with 'me' user
RUN chown -R me:me /usr/local/apache2/

# Start container as me
USER me




# FROM ubuntu:14.04
# RUN apt-get update && apt-get -y install apache2
# ADD index.html /var/www/html/index.html
# RUN mkdir /var/www/test && echo "<html><body><h1>Running from Sufi Docker</h1></body></html>" >> /var/www/test/index.html
# echo "<h1>Running from Sufi Docker on CoreOS</h1>" > /var/www/html/index.html
# EXPOSE 8080
# CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]


# Enable EPEL for Node.js
# RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# Install Node...
# RUN yum install -y npm

# Copy app to /src
# COPY . /src

# Install app and dependencies into /src
# RUN cd /src; npm install

#EXPOSE 8080

#CMD cd /src && node ./app.js

