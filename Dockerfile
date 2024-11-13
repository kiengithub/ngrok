FROM registry.access.redhat.com/ubi8/ubi
USER root
RUN yum -y install wget unzip socat && yum clean all
RUN wget https://drive.google.com/uc?export=download&id=1emabYfp2jn-75cxAwzQlmJemmX0etm9t && \
    ls -l . && \
    unzip ngrok.zip && \
    cp ngrok /usr/bin && \
    rm ngrok.zip
COPY bin/start.sh /bin/start.sh
EXPOSE 8080
ENTRYPOINT /bin/start.sh
