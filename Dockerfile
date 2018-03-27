FROM ubuntu:rolling

ENV uid=1000
ENV gid=1000
ENV user=ubuntu

RUN apt-get update && apt-get install -y \
            x11-apps \
            mesa-utils \
            alsa-utils

RUN groupadd -g $gid $user \
 && useradd -u $uid -g $gid -m $user

USER $user

CMD /bin/bash
