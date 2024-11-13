FROM registry.access.redhat.com/ubi8/ubi
USER root
RUN yum -y install wget unzip socat && yum clean all
RUN wget https://drive.google.com/uc?export=download&id=10x-R1gd5VL0XXJcMjHTG9cyqnlHJ1uem && \
    unzip ngrok-v3-stable-linux-amd64.zip && \
    cp ngrok /usr/bin && \
    rm ngrok-v3-stable-linux-amd64.zip
COPY bin/start.sh /bin/start.sh
EXPOSE 8080
ENTRYPOINT /bin/start.sh
