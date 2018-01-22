FROM registry.cn-shenzhen.aliyuncs.com/xiaoxijin/apline:latest

Maintainer Xijin Xiao (http://github.com/xiaoxijin/)

RUN apk add mysql && \
    apk --update add curl bash openjdk8-jre-base && \
    rm -rf /var/cache/apk/*

ADD install.sh $WORK_DIR
ADD init.sql $WORK_DIR
RUN sh ${WORK_DIR}"install.sh"
ADD my.cnf /etc/mysql/my.cnf

ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV PATH ${PATH}:${JAVA_HOME}/bin

USER mysql
EXPOSE 3306
CMD ["/usr/bin/mysqld_safe"]
