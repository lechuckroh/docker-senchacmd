FROM node:11 as nodejs

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
LABEL name="SenchaCmd 6.7.0.37"

WORKDIR /usr/src/myapp
VOLUME ["/usr/src/myapp"]
ENV PATH="/opt/Sencha/Cmd/6.7.0.37:${PATH}"

RUN cd /tmp && \
    wget -q http://cdn.sencha.com/cmd/6.7.0.37/no-jre/SenchaCmd-6.7.0.37-linux-amd64.sh.zip && \
    unzip *.zip && \
    ./SenchaCmd-6.7.0.37-linux-amd64.sh -q -dir /opt/Sencha/Cmd/6.7.0.37 && \
    rm -f SenchaCmd* && \
    mkdir -p /usr/src/myapp

CMD ["sencha"]
