FROM ubuntu:16.04
RUN apt-get update && apt-get install -qy --no-install-recommends sudo curl ca-certificates build-essential software-properties-common apt-transport-https ninja-build && \
  useradd -m -u 1001 vsts_azpcontainer && \
  echo "vsts_azpcontainer    ALL = (ALL) NOPASSWD: ALL" > /etc/sudoers.d/vsts && \
  curl -s -o - https://apt.llvm.org/llvm-snapshot.gpg.key| apt-key add - && \
  add-apt-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-8 main" && \
  apt-get update -q && \
  apt-get install -qy --no-install-recommends clang-8
