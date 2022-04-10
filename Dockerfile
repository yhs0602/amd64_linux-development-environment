FROM ubuntu:latest

RUN apt-get update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y install net-tools vim openssh-server rsync build-essential cmake gdb git

# /etc/ssh/sshd_config PermitRootLogin yes
RUN sed -i '/PermitRootLogin/ s/#PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN echo 'root:hello' | chpasswd
ENTRYPOINT service ssh start && bash