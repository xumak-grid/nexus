FROM registry.xumak.gt:5000/xumak/oracle-8-jdk
LABEL maintainer = "Eddy Hernández <ehernandez@xumak.com>"

ENV SONATYPE_WORK /sonatype-work
ENV NEXUS_VERSION 2.14.1-01

RUN mkdir -p /opt/sonatype/nexus \
  && curl --fail --silent --location --retry 3 \
    https://download.sonatype.com/nexus/oss/nexus-${NEXUS_VERSION}-bundle.tar.gz \
  | gunzip \
  | tar x -C /tmp nexus-${NEXUS_VERSION} \
  && mv /tmp/nexus-${NEXUS_VERSION}/* /opt/sonatype/nexus/ \
  && rm -rf /tmp/nexus-${NEXUS_VERSION}

# Add custom stuff to setup the repository name
ENV CLIENT_REPOSITORY_NAME=myCompany
COPY nexus.xml ${SONATYPE_WORK}/conf/nexus.xml
COPY templating.sh ${SONATYPE_WORK}/templating.sh

# Create nexus group and user
RUN addgroup -g 201 -S nexus \
    && adduser -S -u 200 -G nexus -h ${SONATYPE_WORK} -s /bin/false nexus \
    && chown -R nexus:nexus ${SONATYPE_WORK} \
    && chmod +x ${SONATYPE_WORK}/templating.sh

VOLUME ${SONATYPE_WORK}

EXPOSE 8081
WORKDIR /opt/sonatype/nexus

USER nexus

ENV CONTEXT_PATH /nexus
ENV MAX_HEAP 768m
ENV MIN_HEAP 256m
ENV JAVA_OPTS -server -Djava.net.preferIPv4Stack=true
ENV LAUNCHER_CONF ./conf/jetty.xml ./conf/jetty-requestlog.xml
CMD ${SONATYPE_WORK}/templating.sh; \
  ${JAVA_HOME}/bin/java \
  -Dnexus-work=${SONATYPE_WORK} -Dnexus-webapp-context-path=${CONTEXT_PATH} \
  -Xms${MIN_HEAP} -Xmx${MAX_HEAP} \
  -cp 'conf/:lib/*' \
  ${JAVA_OPTS} \
  org.sonatype.nexus.bootstrap.Launcher ${LAUNCHER_CONF}