FROM openjdk:11

# npm 6.9.0
ENV NODE_VERSION v10.16.3


RUN apt-get update && apt-get -y install unzip wget
RUN apt install -y jq curl


# Install Node
RUN wget -q https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.gz
RUN cd /usr/local/
RUN tar --strip-components 1 -xzf /node-${NODE_VERSION}-linux-x64.tar.gz
RUN rm -rf /node-${NODE_VERSION}-linux-x64.tar.gz

RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-pip \
        python3-setuptools \
        groff \
        less \
    && pip3 install --upgrade pip \
    && apt-get clean

RUN pip3 --no-cache-dir install --upgrade --user awscli

RUN apt-get clean autoclean