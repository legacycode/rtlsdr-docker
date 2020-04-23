FROM debian:buster-slim

ARG RTLSDR_VERSION=0.6-1
ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.schema-version="1.0" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.name="legacycode/rtlsdr" \
  org.label-schema.description="A Docker image based on Deian Linux ready to run any rtl_sdr command!" \
  org.label-schema.usage="https://hub.docker.com/r/legacycode/rtlsdr" \
  org.label-schema.url="https://hub.docker.com/r/legacycode/rtlsdr" \
  org.label-schema.vcs-url="https://github.com/legacycode/rtlsdr-docker" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.version=$RTLSDR_VERSION \
  maintainer="info@legacycode.org"

RUN apt-get update --yes \
  && apt-get install --no-install-recommends --yes \
    rtl-sdr=$RTLSDR_VERSION \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
