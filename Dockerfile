FROM alpine:3.7

ENV uid=1000
ENV gid=1000
ENV user=alpine

RUN apk update \
 && apk add xeyes \
            sudo

RUN addgroup -g $gid $user \
 && adduser -u $uid -G $user -s /bin/ash -D $user \
 && echo "$user:$user" | /usr/sbin/chpasswd \
 && echo "$user ALL=(ALL) ALL" >> /etc/sudoers

USER $user

WORKDIR /tmp

USER $user

CMD /bin/ash

