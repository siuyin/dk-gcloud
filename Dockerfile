FROM ubuntu:18.04
RUN apt-get update -y && apt-get install -y curl lsb-release python2.7 \
  gnupg && \
  export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
  echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
  apt-get update -y && \
  apt-get install -y google-cloud-sdk && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
