FROM alpine

# 调整apk的安装源为阿里云镜像站点
RUN sed -i 's#\(http\|https\)://[^/]*/alpine/\?#https://mirrors.aliyun.com/alpine/#g' /etc/apk/repositories

# 设置适合的时区
RUN apk add --no-cache tzdata && \
    cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo 'Asia/Shanghai' > /etc/timezone && \
    apk del --no-cache tzdata

# 安装redis工具
RUN apk add --no-cache redis

# 复制redis-cluster相关脚本及配置文件
COPY . /usr/local/redis-cluster

# 给redis-cluster相关脚本赋权
RUN chmod a+x /usr/local/redis-cluster/*.sh

# 集群通讯IP
ENV REDIS_CLUSTER_ANNOUNCE_IP 127.0.0.1

# 开放的redis访问端口
EXPOSE 9901-9906,19901-19906

# redis-cluster入口程序
ENTRYPOINT exec /usr/local/redis-cluster/entrypoint.sh
