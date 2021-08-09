FROM debian:buster-slim

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN dpkg --add-architecture i386
RUN apt-get update -y
RUN apt-get -y install libc6:i386 libreadline7:i386

ADD cheyenne-linux /cheyenne
ADD mysql-protocol.r /libs/mysql-protocol.r

VOLUME /var/log

EXPOSE 80

CMD ["./cheyenne"]
