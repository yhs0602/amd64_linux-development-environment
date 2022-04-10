FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y install net-tools vim openssh-server

# /etc/ssh/sshd_config PermitRootLogin yes
RUN sed -i '/PermitRootLogin/ s/#PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN echo 'root:hello' | chpasswd
ENTRYPOINT service ssh start && bash