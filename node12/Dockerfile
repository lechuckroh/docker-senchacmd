FROM node:12 as nodejs

FROM openjdk:8-jre-stretch

COPY --from=nodejs /usr/local/lib/node_modules /usr/local/lib/node_modules/
COPY --from=nodejs /opt/yarn* /opt/yarn/
COPY --from=nodejs /usr/local/bin/node /usr/local/bin/
RUN cd /usr/local/bin && \
    ln -s /usr/local/bin/node nodejs && \
    ln -s ../lib/node_modules/npm/bin/npm-cli.js npm && \
    ln -s ../lib/node_modules/npm/bin/npx-cli.js npx && \
    ln -s /opt/yarn/bin/yarn yarn && \
    ln -s /opt/yarn/bin/yarnpkg yarnpkg

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
