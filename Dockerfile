FROM alpine:latest
WORKDIR /app
# 安装依赖
RUN apk add --no-cache unzip curl
# 复制你仓库里的压缩包，强制解压避免卡住
COPY China_Telecom_Monitor_amd64.zip .
RUN unzip -o China_Telecom_Monitor_amd64.zip && chmod +x China_Telecom_Monitor_amd64
# 端口和 Railway 保持一致 8081
EXPOSE 8081
# 单行命令，避免构建语法错误，自带崩溃自动重启
CMD /bin/sh -c 'while true; do ./China_Telecom_Monitor_amd64 --port 8081 --username "$USERNAME" --password "$PASSWORD" --dev true; sleep 2; done'
