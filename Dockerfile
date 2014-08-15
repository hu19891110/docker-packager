From ubuntu:14.04
MAINTAINER Nitrous.IO <eng@nitrous.io>

RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  libxml2-dev \
  curl \
  git-core \
  ruby1.9.3 \
  ruby1.9.1-dev \
  libssl-dev

# Install fpm
RUN gem install fpm --no-ri --no-rdoc

# Install freight
RUN git clone git://github.com/rcrowley/freight.git /root/freight && \
  cd /root/freight && \
  make && \
  make install && \
  rm -rf /root/freight

# Install xar
RUN curl -s https://xar.googlecode.com/files/xar-1.5.2.tar.gz \
  | tar -v -C /root -xz && \
  cd /root/xar-1.5.2 && \
  ./configure && \
  make && \
  make install && \
  rm -rf /root/xar-1.5.2

# Install bom
RUN curl -L -s https://github.com/hogliux/bomutils/archive/0.2.tar.gz \
  | tar -v -C /root -zx && \
  cd /root/bomutils-0.2 && \
  make && \
  make install && \
  rm -rf /root/bomutils-0.2
