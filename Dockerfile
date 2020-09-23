FROM centos:8
MAINTAINER kusari-k

RUN sed -i -e "\$afastestmirror=true" /etc/dnf/dnf.conf
RUN dnf install -y java-1.8.0-openjdk && \
	dnf update -y && \
	dnf clean all

COPY run.sh /usr/local/bin/
RUN  chmod 755 /usr/local/bin/run.sh

ENTRYPOINT ["/usr/local/bin/run.sh"]
