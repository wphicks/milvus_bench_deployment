FROM nvidia/cuda:11.8.0-devel-ubuntu20.04

ARG TARGETARCH=amd64

RUN apt-get update && apt-get install -y --no-install-recommends \
    autoconf \
    automake \
    build-essential \
    ca-certificates \
    curl \
    gnupg2 \
    g++ \
    gcc \
    gfortran \
    git \
    make \
    ccache \
    libssl-dev \
    zlib1g-dev \
    unzip \
    clang-format-10 \
    clang-tidy-10 \
    lcov \
    libtool \
    m4 \
    python3 \
    python3-pip \
    pkg-config \
    uuid-dev \
    libaio-dev \
    libgoogle-perftools-dev \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install Go
ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV GO111MODULE on
ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH
RUN mkdir -p /usr/local/go && wget -qO- "https://go.dev/dl/go1.20.7.linux-$TARGETARCH.tar.gz" | tar --strip-components=1 -xz -C /usr/local/go && \
    mkdir -p "$GOPATH/src" "$GOPATH/bin" && \
    go clean --modcache && \
    chmod -R 777 "$GOPATH" && chmod -R a+w $(go env GOTOOLDIR)

RUN if [ "$TARGETARCH" = "amd64" ]; then CMAKE_SUFFIX=x86_64; else CMAKE_SUFFIX=aarch64; fi &&\
    wget -qO- "https://cmake.org/files/v3.26/cmake-3.26.4-linux-$CMAKE_SUFFIX.tar.gz" | tar --strip-components=1 -xz -C /usr/local

RUN pip install conan==1.58.0 && mkdir /workspace

WORKDIR /workspace

ENTRYPOINT ["make"]
