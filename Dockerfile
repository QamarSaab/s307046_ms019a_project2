FROM ubuntu:14.04

MAINTAINER s307046@studssh.cs.hioa.no

RUN apt-get update && apt-get -y install apache2

# ADD index.html /var/www/html/index.html
RUN mkdir /var/www/test && echo "<html><body><h1>Running from Sufi Docker</h1></body></html>" >> /var/www/test/index.html
# echo "<h1>Running from Sufi Docker on CoreOS</h1>" > /var/www/html/index.html
EXPOSE 8080
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]


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

