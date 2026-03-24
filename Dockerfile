FROM debian:bullseye-slim
WORKDIR /app

# 安装依赖，Debian 自带 glibc，完美兼容你的程序
RUN apt-get update && apt-get install -y unzip curl && rm -rf /var/lib/apt/lists/*

# 复制并解压你的二进制包
COPY China_Telecom_Monitor_amd64.zip .
RUN unzip -o China_Telecom_Monitor_amd64.zip && chmod +x China_Telecom_Monitor_amd64

EXPOSE 8081

# 启动命令，这次肯定能跑起来
CMD /bin/sh -c 'while true; do ./China_Telecom_Monitor_amd64 --port 8081 --username "$USERNAME" --password "$PASSWORD" --dev true; sleep 2; done'
