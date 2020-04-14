FROM alpine:3.11

ARG RTLSDR_VERSION=0.6.0
ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.schema-version="1.0" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.name="legacycode/rtlsdr" \
  org.label-schema.description="A Docker image based on Alpine Linux ready to run any rtl_sdr command!" \
  org.label-schema.usage="https://hub.docker.com/r/legacycode/rtlsdr" \
  org.label-schema.url="https://hub.docker.com/r/legacycode/rtlsdr" \
  org.label-schema.vcs-url="https://github.com/legacycode/rtlsdr-docker" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.version=$RTLSDR_VERSION \
  maintainer="info@legacycode.org"

RUN apk --no-cache add \
  build-base=0.5-r1 \
  cmake=3.15.5-r0 \
  git=2.24.1-r0 \
  libc6-compat=1.1.24-r2 \
  libusb-dev=1.0.23-r0

WORKDIR /tmp

RUN git clone --branch $RTLSDR_VERSION git://git.osmocom.org/rtl-sdr.git && \
  mkdir rtl-sdr/build && \
  cd rtl-sdr/build && \
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON && \
  make  && \
  make install && \
  rm -rf /tmp/rtl-sdr
