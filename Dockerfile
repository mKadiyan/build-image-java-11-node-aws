FROM openjdk:11

# npm 6.9.0
ENV NODE_VERSION v10.15.3


RUN apt-get update && apt-get -y install unzip wget
RUN apt install -y jq curl


# Install Node
RUN wget -q https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.gz
RUN cd /usr/local/
RUN tar --strip-components 1 -xzf /node-${NODE_VERSION}-linux-x64.tar.gz
RUN rm -rf /node-${NODE_VERSION}-linux-x64.tar.gz

RUN apt-get clean autoclean