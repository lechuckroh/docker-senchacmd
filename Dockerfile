FROM openjdk:8-jre-stretch

LABEL maintainer="Lechuck Roh <lechuckroh@gmail.com>"
LABEL name="SenchaCmd 5.1.3.61"

WORKDIR /usr/src/myapp
VOLUME ["/usr/src/myapp"]
ENV PATH="/opt/Sencha/Cmd/5.1.3.61:${PATH}"

RUN cd /tmp && \
    wget -q https://cdn.sencha.com/cmd/5.1.3.61/SenchaCmd-5.1.3.61-linux-x64.run.zip && \
    unzip *.zip && \
    chmod +x /tmp/SenchaCmd-5.1.3.61-linux-x64.run && \
    /tmp/SenchaCmd-5.1.3.61-linux-x64.run --unattendedmodeui minimal --mode unattended --prefix /opt && \
    rm -f SenchaCmd* && \
    mkdir -p /usr/src/myapp

CMD ["sencha"]
