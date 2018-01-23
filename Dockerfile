FROM zhangfeiyu2005/mysql

# Install cURL
RUN echo -e "https://mirrors.ustc.edu.cn/alpine/v3.7/main\n\
https://mirrors.ustc.edu.cn/alpine/v3.7/community" > /etc/apk/repositories

RUN apk --update add curl bash openjdk8-jre-base && \
      rm -rf /var/cache/apk/*

# Set environment
ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV PATH ${PATH}:${JAVA_HOME}/bin
