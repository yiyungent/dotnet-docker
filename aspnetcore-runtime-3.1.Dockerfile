# https://docs.microsoft.com/zh-cn/dotnet/core/install/linux-ubuntu#2004-

FROM ubuntu:20.04 AS base

LABEL maintainer="yiyun <yiyungent@gmail.com>"

# 设置国内阿里云镜像源
COPY etc/apt/aliyun-ubuntu-20.04-focal-sources.list   /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y wget

# 将 Microsoft 包签名密钥添加到受信任密钥列表，并添加包存储库
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
# 安装运行时
RUN apt-get update
RUN apt-get install -y apt-transport-https
RUN apt-get update
RUN apt-get install -y aspnetcore-runtime-3.1

# 时区设置
ENV TZ=Asia/Shanghai