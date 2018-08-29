FROM ubuntu:bionic

ARG CMAKE_VERSION=3.11.1
ARG GOOGLE_TEST_VERSION=1.8.0
ARG MONGO_C_VERSION=1.4.3
ARG MONGO_CXX_VERSION=3.0.2
ARG ZEROMQ_VERSION=4.3.0
ARG LIBZMQ_CPP_VERSION=4.2.3
ARG LIBZMQ_VERSION=4.2.3
ARG LIBBOOST_VERSION=1.65.1
# Should be the same as boost version replacing the dots for underscores
ARG LIBBOOST_REF=1_65_1
ARG ROCKSB_VERSION=5.12.4

RUN apt-get update -y && apt-get upgrade -y && apt-get clean && apt-get install -y --no-install-recommends \
  git \
  curl \
  wget \
  vim \
  autoconf \
  automake \
  apt-file \
  build-essential \
  software-properties-common \
  pkg-config \
  python3 \
  libc6-dev \
  libssl-dev \
  libsasl2-dev \
  libtool \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# gcc,g++ 7
RUN add-apt-repository ppa:ubuntu-toolchain-r/test \
  && apt-get update && apt-get install -y --no-install-recommends gcc-7 g++-7 \
  && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && rm /usr/bin/gcc /usr/bin/g++ \
  && ln -s /usr/bin/gcc-7 /usr/bin/gcc \
  && ln -s /usr/bin/g++-7 /usr/bin/g++

# cmake
RUN git clone https://gitlab.kitware.com/cmake/cmake.git -b v${CMAKE_VERSION} --depth 1 \
  && cd cmake \
  && ./bootstrap --prefix=/usr/local && make -j4 && make install \
  && cd -

# boost
RUN wget https://dl.bintray.com/boostorg/release/${LIBBOOST_VERSION}/source/boost_${LIBBOOST_REF}.tar.gz \
  && tar xzf boost_${LIBBOOST_REF}.tar.gz && cd boost_${LIBBOOST_REF} \
  && ./bootstrap.sh && ./b2 toolset=gcc install --prefix=/usr/local -j4 \
  && cd -

# gtest
RUN git clone https://github.com/google/googletest.git -b release-${GOOGLE_TEST_VERSION} --depth 1 \
  && mkdir -p googletest/_build && cd googletest/_build \
  && cmake -DCMAKE_INSTALL_PREFIX=/usr/local .. && make -j4 && make install \
  && cd -

# rocksdb
RUN git clone https://github.com/facebook/rocksdb.git -b v${ROCKSB_VERSION} --depth 1 \
  && mkdir -p rocksdb/_build && cd rocksdb/_build \
  && cmake -DCMAKE_INSTALL_PREFIX=/usr/local .. && make -j4 && make install \
  && cd -

# zmqlib
RUN git clone https://github.com/zeromq/libzmq.git -b v${LIBZMQ_VERSION} --depth 1 \
  && mkdir -p libzmq/_build && cd libzmq/_build \
  && cmake -DCMAKE_INSTALL_PREFIX=/usr/local .. && make -j4 && make install \
  && cd -

# cppzmq
RUN git clone https://github.com/zeromq/cppzmq.git -b v${LIBZMQ_CPP_VERSION} --depth 1 \
  && mkdir -p cppzmq/_build && cd cppzmq/_build \
  && cmake -DCMAKE_INSTALL_PREFIX=/usr/local .. && make -j4 && make install \
  && cd -

# mongo-c
RUN git clone https://github.com/mongodb/mongo-c-driver.git -b ${MONGO_C_VERSION} --depth 1 && cd mongo-c-driver \
  && ./autogen.sh && ./configure --disable-automatic-init-and-cleanup --prefix=/usr/local \
  && make -j4 && make install \
  && cd -

# mongo-cxx
RUN git clone https://github.com/mongodb/mongo-cxx-driver.git -b r${MONGO_CXX_VERSION} --depth 1 && cd mongo-cxx-driver/build \
  && cmake -DBSONCXX_POLY_USE_BOOST=1 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local .. \
  && make -j4 && make install \
  && cd -

CMD ["/usr/bin/bash"]
