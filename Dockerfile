FROM ubuntu:20.04

COPY ./files/ /tmp/files

RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/mirrors.aliyun.com/g" /etc/apt/sources.list && \
    sed -i '/security/d' /etc/apt/sources.list && \
    apt-get update && apt-get -y dist-upgrade && \
    apt-get install -y lib32z1 xinetd libstdc++6 lib32stdc++6 && \
    echo 'ctf - nproc 1500' >>/etc/security/limits.conf && \
    useradd -U -m ctf && \
    mkdir -p /home/ctf && \
    cp -R /lib* /home/ctf && \
    mkdir /home/ctf/usr && \
    cp -R /usr/lib* /home/ctf/usr && \
    mkdir /home/ctf/bin && \
    cp /bin/cat /home/ctf/bin && \
    chown -R root:ctf /home/ctf && \
    chmod -R 750 /home/ctf && \
    mkdir /home/ctf/dev && \
    mknod /home/ctf/dev/null c 1 3 && \
    mknod /home/ctf/dev/zero c 1 5 && \
    mknod /home/ctf/dev/random c 1 8 && \
    mknod /home/ctf/dev/urandom c 1 9 && \
    chmod 666 /home/ctf/dev/* && \
    apt-get clean && \
    mv /tmp/files/ctf.xinetd /etc/xinetd.d/ctf && \
    mv /tmp/files/pwn /home/ctf/pwn && \
    mv /tmp/files/start.sh / && \
    mv /tmp/files/flag.sh / && \
    mv /tmp/files/readflag /home/ctf/bin/sh && \
    chmod +x /home/ctf/bin/sh && \
    rm -rf /tmp/* /var/tmp/*

WORKDIR /home/ctf

CMD /start.sh

EXPOSE 9999
