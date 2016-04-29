FROM centos:centos7

# Enable EPEL for Node.js
RUN rpm -Uvh http://fedora.uib.no/epel/epel-release-latest-7.noarch.rpm

# Install Node...
RUN yum install -y npm

# Copy app to /src
COPY . /src

# Install app and dependencies into /src
RUN cd /src; npm install

EXPOSE 8080

CMD cd /src && node ./app.js
