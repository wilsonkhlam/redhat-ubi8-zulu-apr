FROM registry.access.redhat.com/ubi8/ubi AS APR
RUN cd /tmp \
	&& curl http://apache.communilink.net/tomcat/tomcat-connectors/native/1.2.25/source/tomcat-native-1.2.25-src.tar.gz | tar -xzf - \
	&& cd /tmp/tomcat*/native \
	&& rpm -Uvh https://cdn.azul.com/zulu/bin/zulu-repo-1.0.0-1.noarch.rpm \
	&& yum --assumeyes install zulu11-jdk-headless apr-devel openssl-devel gcc make redhat-rpm-config \
	&& ./configure --with-java-home=/usr/lib/jvm/zulu11 --with-ssl=yes \
	&& make \
	&& make install


FROM registry.access.redhat.com/ubi8/ubi-minimal
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en'
ENV LD_LIBRARY_PATH=/usr/local/apr/lib
RUN rpm -Uvh https://cdn.azul.com/zulu/bin/zulu-repo-1.0.0-1.noarch.rpm \
    && microdnf update \
	&& microdnf install zulu11-jdk-headless apr openssl \
    && microdnf clean all \
	&& mkdir -p /usr/local/apr/lib
COPY --from=APR /usr/local/apr/lib /usr/local/apr/lib
