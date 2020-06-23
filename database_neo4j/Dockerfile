
FROM openjdk:11-jdk-slim

ENV NEO4J_VERSION=4.0.6 \
    NEO4J_SHA256=47a7edfe0f673517c7c21b33b5f124377cbfa1763081475ba1013caa6ad2340e
ENV NEO4J_EDITION=community
ENV NEO4J_TARBALL=neo4j-${NEO4J_EDITION}-${NEO4J_VERSION}-unix.tar.gz \
    NEO4J_HOME="/var/lib/neo4j" \
    TINI_VERSION="v0.19.0" \
    TINI_SHA256="93dcc18adc78c65a028a84799ecf8ad40c936fdfc5f2a57b1acda5a8117fa82c"
ARG NEO4J_URI=https://neo4j.com/artifact.php?name=${NEO4J_TARBALL}

ENV APOC_RELEASE="4.0.0.15" \
    APOC_RELEASES_URL=https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download
ENV APOC_PLUGIN_JAR=apoc-${APOC_RELEASE}-all.jar
ARG APOC_PLUGIN_URL=${APOC_RELEASES_URL}/${APOC_RELEASE}/${APOC_PLUGIN_JAR}

RUN addgroup --gid 7474 --system neo4j && adduser --uid 7474 --system --no-create-home --home "${NEO4J_HOME}" --ingroup neo4j neo4j

# ENV SPATIAL_RELEASE 0.25.6-neo4j-3.4.5
# ENV SPATIAL_RELEASES_URL https://github.com/neo4j-contrib/m2/blob/master/releases/org/neo4j/neo4j-spatial
# ENV SPATIAL_PLUGIN_JAR neo4j-spatial-${SPATIAL_RELEASE}-server-plugin.jar
# ENV SPATIAL_PLUGIN_URL ${SPATIAL_RELEASES_URL}/${SPATIAL_RELEASE}/${SPATIAL_PLUGIN_JAR}
# && curl --output /var/lib/neo4j/plugins/${SPATIAL_PLUGIN_JAR} --location "${SPATIAL_PLUGIN_URL}?raw=true" \

RUN apt update \
    && apt install -y curl wget gosu jq \
    && curl -L "https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini" -o /sbin/tini \
    && echo "${TINI_SHA256}  /sbin/tini" | sha256sum -c --strict --quiet \
    && chmod +x /sbin/tini \
    && curl -L ${NEO4J_URI} -o ${NEO4J_TARBALL} && ls -la \
    && echo "${NEO4J_SHA256}  ${NEO4J_TARBALL}" | sha256sum -c --strict --quiet \
    && tar --extract --file ${NEO4J_TARBALL} --directory /var/lib \
    && mv /var/lib/neo4j-* "${NEO4J_HOME}" \
    && rm ${NEO4J_TARBALL} \
    && mv "${NEO4J_HOME}"/data /data \
    && mv "${NEO4J_HOME}"/logs /logs \
    && chown -R neo4j:neo4j /data \
    && chmod -R 777 /data \
    && chown -R neo4j:neo4j /logs \
    && chmod -R 777 /logs \
    && chown -R neo4j:neo4j "${NEO4J_HOME}" \
    && chmod -R 777 "${NEO4J_HOME}" \
    && ln -s /data "${NEO4J_HOME}"/data \
    && ln -s /logs "${NEO4J_HOME}"/logs \
    && curl -o ${NEO4J_HOME}/plugins/${APOC_PLUGIN_JAR} -L ${APOC_PLUGIN_URL} \
    && rm -rf /tmp/* \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y purge --auto-remove curl

ENV PATH "${NEO4J_HOME}"/bin:$PATH
WORKDIR "${NEO4J_HOME}"
VOLUME /data /logs
COPY docker-entrypoint.sh /docker-entrypoint.sh
EXPOSE 7474 7473 7687
ENTRYPOINT ["/sbin/tini", "-g", "--", "/docker-entrypoint.sh"]
CMD ["neo4j"]