FROM registry.access.redhat.com/ubi8/ubi
USER root
RUN yum -y install wget unzip socat && yum clean all
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip 
RUN ls -l .
COPY bin/start.sh /bin/start.sh
EXPOSE 8080
ENTRYPOINT /bin/start.sh
