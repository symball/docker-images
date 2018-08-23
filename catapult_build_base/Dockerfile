FROM alpine:edge

ARG MONGO_C_VERSION=1.12.0
ARG MONGO_CXX_VERSION=3.3.1
ARG ZEROMQ_VERSION=4.3.0
ARG LIBZQ_VERSION=4.2.5
ARG BOOST_VERSION=1.65.1
# Should be the same as boost version replacing the dots for underscores
ARG BOOST_REF=1_65_1

# Install the base services to build from
WORKDIR /opt
RUN apk --update --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ add \
  bash \
  build-base \
  git \
  wget \
  # Specific libraries for project compilation
  cppzmq \
  gtest \
  gtest-dev \
  rocksdb-dev

# Boost Driver as prerequisite
WORKDIR /opt
RUN wget https://dl.bintray.com/boostorg/release/${BOOST_VERSION}/source/boost_${BOOST_REF}.tar.gz && \
  tar xvf boost_${BOOST_REF}.tar.gz && \
  cd boost_${BOOST_REF} && \
  ./bootstrap.sh && \
  ./b2 install -j2

# Mongo C Driver as prerequisite
WORKDIR /opt
RUN wget https://github.com/mongodb/mongo-c-driver/archive/${MONGO_C_VERSION}.tar.gz && \
    ls -la && \
    tar xvf ${MONGO_C_VERSION}.tar.gz && \
    cd mongo-c-driver-${MONGO_C_VERSION} && \
    mkdir cmake-build && \
    cd cmake-build && \
    cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF -DCMAKE_INSTALL_PREFIX=/usr/local .. && \
    make && \
    make install

# Mongo C** Driver
WORKDIR /opt
RUN wget https://github.com/mongodb/mongo-cxx-driver/archive/r${MONGO_CXX_VERSION}.tar.gz && \
    tar -xvf r${MONGO_CXX_VERSION}.tar.gz && \
    cd mongo-cxx-driver-r${MONGO_CXX_VERSION}/build && \
    cmake -DBSONCXX_POLY_USE_BOOST=1 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local .. && \
    make && \
    make install

# C** MQ Driver
WORKDIR /opt
RUN wget https://github.com/zeromq/cppzmq/archive/v${ZEROMQ_VERSION}.tar.gz && \
  tar xvf v${ZEROMQ_VERSION}.tar.gz zeromq && \
  cd zeromq && \
  mkdir _build && \
  cd _build && \
  cmake -DCMAKE_INSTALL_PREFIX=/usr/local .. && \
  make && \
  make install

# ZeroMQ Driver
WORKDIR /opt
RUN wget https://github.com/zeromq/libzmq/archive/v${LIBZQ_VERSION}.tar.gz && \
  tar xvf v${LIBZQ_VERSION} && \
  mkdir -p libzmq-${LIBZQ_VERSION}/_build && \
  cd libzmq-${LIBZQ_VERSION}/build && \
  cmake -DCMAKE_INSTALL_PREFIX=/usr/local .. && \
  make && \
  make install

WORKDIR /opt

CMD ["/usr/bin/bash"]
