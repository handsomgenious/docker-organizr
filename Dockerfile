FROM lsiobase/alpine.nginx:3.7

# set version label
ARG BUILD_DATE
ARG VERSION
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
          org.label-schema.name="docker-organizr-v2" \
          org.label-schema.url="e.g. https://github.com/handsomgenious/docker-organizr-v2" \
          org.label-schema.vcs-ref=$VCS_REF \
          org.label-schema.vcs-url="https://github.com/causefx/organizr" \
          org.label-schema.version=$VERSION \
          org.label-schema.schema-version="1.0"

RUN \
 echo "**** install packages ****" && \
 apk add --no-cache \
	curl \
	php7-curl \
	php7-ldap \
	php7-pdo_sqlite \
	php7-sqlite3 \
	php7-session \
	php7-zip

# add local files
COPY root/ /

# ports and volumes
EXPOSE 80
VOLUME /config
