# syntax=docker/dockerfile:1
FROM python:3.10.10-buster

# Labels
ARG LABEL_SCHEMA_CONVENTION="org.label-schema"
ARG LABEL_SCHEMA_VERSION="1.0"
ARG LABEL_NAME="tools-infrastructure"
ARG LABEL_DESCRIPTION="Container that contains base tools for ops"
ARG LABEL_VCS_URL="https://github.com/str-username/infrastructure-snippets"
ARG LABEL_VCS_REF
ARG LABEL_VERSION

# Versions
ARG TERRAFORM_VERSION=1.3.9
ARG ANSIBLE_VERSION=2.12.3
ARG KUBECTL_VERSION=1.26.0
ARG HELM_VERSION=3.11.1
ARG GO_VERSION=1.20.1

# Base env
ENV PATH="$HOME/.tfenv/bin:$PATH"
ENV PATH="$PATH:/usr/local/go/bin"

# Labels
LABEL $LABEL_SCHEMA_CONVENTION.name=$LABEL_NAME
LABEL $LABEL_SCHEMA_CONVENTION.vcs-url=$LABEL_VCS_URL
LABEL $LABEL_SCHEMA_CONVENTION.vcs-ref=$LABEL_VCS_REF
LABEL $LABEL_SCHEMA_CONVENTION.version=$LABEL_VERSION
LABEL $LABEL_SCHEMA_CONVENTION.description=$LABEL_DESCRIPTION
LABEL $LABEL_SCHEMA_CONVENTION.schema-version=$LABEL_SCHEMA_VERSION

WORKDIR tools

RUN apt-get update \
    && apt-get install -y \
    software-properties-common \
    git \
    curl \
    unzip \
    ca-certificates \
    apt-transport-https \
    dnsutils \
    apache2-utils \
    tcpdump \
    # Terraform
    && git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv \
    && ln -s ~/.tfenv/bin/* /usr/local/bin \
    && tfenv install $TERRAFORM_VERSION \
    && rm -rf ./tfenv \
    # Ansible
    && pip install ansible-core==$ANSIBLE_VERSION \
    # Kubectl
    && curl -LO https://dl.k8s.io/release/v$KUBECTL_VERSION/bin/linux/amd64/kubectl \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
    # Helm
    && curl -LO https://get.helm.sh/helm-v$HELM_VERSION-linux-amd64.tar.gz \
    && tar -zxvf helm-v$HELM_VERSION-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    # Golang
    && curl -LO https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz \
    &&  tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz \
    # Aws cli \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    # Clear
    && rm -rf *

CMD ["/bin/bash"]