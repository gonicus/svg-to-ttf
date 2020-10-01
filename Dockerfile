FROM registry.fedoraproject.org/fedora-minimal:32
RUN microdnf install -y fontforge python3-beautifulsoup4 && \
    microdnf clean all && \
    mkdir /data
COPY src/svg-to-ttf /usr/local/bin

WORKDIR /data
ENTRYPOINT ["/usr/local/bin/svg-to-ttf"]
