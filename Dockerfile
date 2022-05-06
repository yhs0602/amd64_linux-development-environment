FROM ubuntu:22.04

RUN apt-get update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y install net-tools vim openssh-server rsync build-essential cmake gdb git valgrind
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" --\
        -p git -p ssh-agent -p 'history-substring-search' \
        -p 'zsh-autosuggestions' \
        -a 'bindkey "\$terminfo[kcuu1]" history-substring-search-up' \
        -a 'bindkey "\$terminfo[kcud1]" history-substring-search-down'
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# /etc/ssh/sshd_config PermitRootLogin yes
RUN sed -i '/PermitRootLogin/ s/#PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN echo 'root:hello' | chpasswd
ENTRYPOINT service ssh start && zsh