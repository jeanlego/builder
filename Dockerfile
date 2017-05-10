FROM ubuntu:16.04
RUN apt-get update

RUN apt-get install -y clang openssh-server build-essential g++ gcc automake git cmake flex bison ctags
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

RUN mkdir -p /workspace

VOLUME /workspace

CMD    ["/usr/sbin/sshd", "-D"]
