FROM registry.access.redhat.com/ubi8/ubi
USER root
RUN yum -y install wget unzip socat && yum clean all
RUN wget https://file.io/wGt9cxDFwVQ0 && \
    unzip ngrok-stable-linux-amd64.zip && \
    cp ngrok /usr/bin && \
    rm ngrok-stable-linux-amd64.zip
COPY bin/start.sh /bin/start.sh
EXPOSE 8080
ENTRYPOINT /bin/start.sh
