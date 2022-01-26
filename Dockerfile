FROM registry.access.redhat.com/ubi8/ubi-minimal:latest


RUN microdnf update -y && microdnf install -y tar gzip curl jq wget git make go


# Install oc/kubectl
RUN curl -sLO https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz -o openshift-client-linux.tar.gz && \
    tar xzf openshift-client-linux.tar.gz && chmod +x oc && mv oc /usr/local/bin/oc && \
    chmod +x kubectl && mv kubectl /usr/local/bin/kubectl && rm openshift-client-linux.tar.gz

# Install yq
RUN curl -sLO https://github.com/mikefarah/yq/releases/download/v4.2.0/yq_linux_amd64 -o yq_linux_amd64 &&\
    mv yq_linux_amd64 /usr/local/bin/yq && \
    chmod +x /usr/local/bin/yq
