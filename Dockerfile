FROM alpine:latest
WORKDIR /app

# 先安装 wget 和 ca-certificates（解决网络和证书问题）
RUN apk add --no-cache wget ca-certificates

# 下载预编译好的 Go 二进制文件
RUN wget -O China_Telecom_Monitor_amd64 https://github.com/kkHAIKE/ChinaTelecomMonitor/releases/download/v1.0/China_Telecom_Monitor_amd64
RUN chmod +x China_Telecom_Monitor_amd64

# 暴露端口
EXPOSE 8080

# 启动程序
CMD ["./China_Telecom_Monitor_amd64", "--port", "8080", "--dev", "true"]
