FROM registry.access.redhat.com/ubi8/ubi
USER root
RUN yum -y install wget unzip socat && yum clean all
RUN wget --no-check-certificate "https://drive.google.com/uc?export=download&id=1emabYfp2jn-75cxAwzQlmJemmX0etm9t" -O ngrok.zip 
RUN unzip ngrok.zip && \
    cp ngrok /usr/bin && \
    rm ngrok.zip
COPY bin/start.sh /bin/start.sh
RUN chown -R nobody:nobody /bin/start.sh
RUN chmod -R 777 /bin/start.sh
RUN chown -R nobody:nobody /usr/bin/ngrok
RUN chmod -R 777 /usr/bin/ngrok
RUN ngrok config add-authtoken 2p3b4FDFMcFjk4IO1wnSURfiH3S_6iGADx4aAUMiUsNGabZGD
EXPOSE 8080
ENTRYPOINT /bin/start.sh
