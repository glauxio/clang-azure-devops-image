ARG BASE_IMAGE=ubuntu:16.04
FROM ${BASE_IMAGE}
ARG DIST=xenial
RUN apt-get update && apt-get install -qy --no-install-recommends sudo curl ca-certificates build-essential software-properties-common apt-transport-https cmake ninja-build && \
  if [ x"${DIST}" == x"xenial" ]; then \
    apt-get install -qy --no-install-recommends gnupg-agent \
  else \
    apt-get intall -qy --no-install-recommends gpg-agent \
  fi \
  echo "vsts_azpcontainer    ALL = (ALL) NOPASSWD: ALL" > /etc/sudoers.d/vsts && \
  curl -s -o - https://apt.llvm.org/llvm-snapshot.gpg.key| apt-key add - && \
  add-apt-repository "deb http://apt.llvm.org/${DIST}/ llvm-toolchain-${DIST}-9 main" && \
  apt-get update -q && \
  apt-get install -qy --no-install-recommends clang-9
