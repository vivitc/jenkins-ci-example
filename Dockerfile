FROM jenkins/jenkins:2.116

COPY config/*.groovy /usr/share/jenkins/ref/init.groovy.d/

COPY config/config.xml  /usr/share/jenkins/ref/

#As an example, we are uploading this key, we do not recommend in production code
COPY config/secrets/master.key /usr/share/jenkins/ref/secrets/
COPY config/secrets/hudson.util.Secret /usr/share/jenkins/ref/secrets/

RUN mkdir /usr/share/jenkins/ref/users
COPY config/users /usr/share/jenkins/ref/users

COPY config/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
