FROM alpine:latest
WORKDIR /app

# 下载预编译好的 Go 二进制文件
RUN wget -O China_Telecom_Monitor_amd64 https://github.com/kkHAIKE/ChinaTelecomMonitor/releases/download/v1.0/China_Telecom_Monitor_amd64
RUN chmod +x China_Telecom_Monitor_amd64

# 暴露端口（和程序启动端口保持一致）
EXPOSE 8080

# 启动程序（会读取你在 Railway 里配置的 USERNAME 和 PASSWORD 环境变量）
CMD ["./China_Telecom_Monitor_amd64", "--port", "8080", "--dev", "true"]
