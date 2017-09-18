FROM ubuntu:16.04

MAINTAINER zylowskimichal@gmail.com

RUN apt-key adv --keyserver keyserver.ubuntu.com  --recv E56151BF
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install curl python-setuptools python-pip python-dev python-protobuf lsb-core wget apt-transport-https
RUN DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]'); CODENAME=$(lsb_release -cs); echo "deb http://repos.mesosphere.io/${DISTRO}  ${CODENAME} main" | tee /etc/apt/sources.list.d/mesosphere.list

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install mesos=1.1.0-2.0.107.ubuntu1604
RUN curl -fLsS https://get.docker.com/ | sh

ENTRYPOINT ["mesos-slave"]
