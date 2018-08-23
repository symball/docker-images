FROM alpine:edge

ARG MONGO_C_VERSION=1.12.0
ARG MONGO_CXX_VERSION=3.3.1

# Install the base services to build from
RUN apk --update --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ add \
  bash \
  build-base \
  git \
  wget \
  # Specific libraries for project compilation
  boost-dev \
  cppzmq \
  gtest \
  gtest-dev \
  rocksdb-dev \
  zeromq-dev

WORKDIR /src
RUN wget https://github.com/mongodb/mongo-c-driver/archive/${MONGO_C_VERSION}.tar.gz && \
    ls -la && \
    tar xvf ${MONGO_C_VERSION}.tar.gz && \
    cd mongo-c-driver-${MONGO_C_VERSION} && \
    mkdir cmake-build && \
    cd cmake-build && \
    cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF -DCMAKE_INSTALL_PREFIX=/usr/local .. && \
    make && \
    make install

WORKDIR /src
RUN wget https://github.com/mongodb/mongo-cxx-driver/archive/r${MONGO_CXX_VERSION}.tar.gz && \
    tar -xz-xf r${MONGO_CXX_VERSION}.tar.gz && \
    cd mongo-cxx-driver-r${MONGO_CXX_VERSION}/build && \
    cmake -DBSONCXX_POLY_USE_BOOST=1 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local .. && \
    make && \
    make install

WORKDIR /src

CMD ["/usr/bin/bash"]
