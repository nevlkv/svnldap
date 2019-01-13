FROM alpine:3.8
MAINTAINER Nikolay Volkov <ne.volkov@gmail.com>
RUN apk --update add --no-cache  apache2 apache2-utils apache2-webdav mod_dav_svn apache2-ldap subversion \
    && mkdir -p /run/apache2/ \
    && rm -rf /var/cache/apk/*
ADD entrypoint.sh /entrypoint.sh
VOLUME ["/opt"]
EXPOSE 80 
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
