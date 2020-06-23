FROM alpine:3.9

ENV HUGO_VERSION 0.61.0

# Supporting packages
RUN apk --update add \
    curl \
    g++ \
    git \
    go \
    musl-dev \
    nginx

# Adding GO paths to environment
ENV PATH "$PATH:$HOME/go/bin"
ENV GOPATH "$HOME/go"
ENV GOHOME "$GOPATH"

# Install Hugo Static Site Generator
WORKDIR /tmp
RUN curl -L https://github.com/gohugoio/hugo/archive/v${HUGO_VERSION}.tar.gz -o hugo.tar.gz && \
  tar xvf hugo.tar.gz && \
  cd hugo-${HUGO_VERSION} && \
  go install --tags extended