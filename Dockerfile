From ubuntu:14.04
MAINTAINER Nitrous.IO <eng@nitrous.io>

RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  libxml2-dev \
  curl \
  git-core \
  ruby1.9.3 \
  ruby1.9.1-dev \
  libssl-dev \
  python-dateutil

# Install fpm
RUN gem install fpm --version 1.2.0 --no-ri --no-rdoc

# Install deb-s3
RUN gem install deb-s3 --version 0.6.2 --no-ri --no-rdoc

# Install freight
RUN git clone git://github.com/rcrowley/freight.git /root/freight && \
  cd /root/freight && \
  make && \
  make install && \
  rm -rf /root/freight

# Setup freight
RUN mkdir -p /get.nitrous.io/{cache,lib,.gpg}
ADD files/freight.conf /get.nitrous.io/.freight.conf
ADD files/freightadder /usr/bin/freightadder
ADD files/freightcacher /usr/bin/freightcacher

RUN chmod +x /usr/bin/freightadder
RUN chmod +x /usr/bin/freightcacher

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

# Install s3cmd
RUN curl -L -s https://github.com/s3tools/s3cmd/archive/v1.5.0-rc1.tar.gz \
  | tar -v -C /root -xz && \
  cd /root/s3cmd-1.5.0-rc1 && \
  python setup.py install && \
  rm -rf /root/s3cmd-1.5.0-rc1
