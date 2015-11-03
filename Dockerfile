FROM centos:latest
MAINTAINER zhoujing@docker.com
RUN yum install -y automake autoconf libtool make gcc wget lua-devel git unzip readline-devel pcre-devel openssl-devel
RUN cd /tmp && wget https://github.com/keplerproject/luarocks/archive/v2.2.2.tar.gz && wget https://openresty.org/download/ngx_openresty-1.9.3.1.tar.gz
RUN cd /tmp && tar zxf v2.2.2.tar.gz && cd luarocks-2.2.2 && ./configure && make build && make install
RUN luarocks install vanilla
RUN cd /tmp && tar zxf ngx_openresty-1.9.3.1.tar.gz && cd ngx_openresty-1.9.3.1 && ./configure && gmake && gmake install && ln -sf /usr/local/openresty/nginx/sbin/nginx /usr/bin/nginx