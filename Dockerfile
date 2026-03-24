
AS builder
WORKDIR /build
# 复制源码
COPY . .
# 编译适配当前平台的二进制
RUN go build -o China_Telecom_Monitor_amd64 ./cmd/main.go

# 第二阶段：运行环境
FROM debian:bullseye-slim
WORKDIR /app
# 复制编译好的二进制
COPY --from=builder /build/China_Telecom_Monitor_amd64 .
RUN chmod +x China_Telecom_Monitor_amd64
# 安装依赖
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

EXPOSE 8081
# 启动命令，自动重启
CMD /bin/sh -c 'while true; do ./China_Telecom_Monitor_amd64 --port 8081 --username "$USERNAME" --password "$PASSWORD" --dev true; sleep 2; done'
