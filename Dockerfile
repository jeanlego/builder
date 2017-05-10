FROM ubuntu
RUN apt-get update

RUN apt-get install -y supervisor build-essential g++ curl libssl-dev apache2-utils git libxml2-dev sshfs libx11-dev libxft-dev fontconfig libcairo2-dev gcc automake git cmake flex bison ctags libpam-cracklib
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

RUN mkdir -p /workspace

VOLUME /workspace

CMD    ["/usr/sbin/sshd", "-D"]
