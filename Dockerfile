FROM alpine:latest
WORKDIR /app

# 安装必需依赖
RUN apk add --no-cache unzip curl ca-certificates

# 复制压缩包并强制解压（不会卡住）
COPY China_Telecom_Monitor_amd64.zip /app/
RUN unzip -o China_Telecom_Monitor_amd64.zip && chmod +x China_Telecom_Monitor_amd64

# 暴露端口（和 Railway 保持一致 8081）
EXPOSE 8081

# 🔥 长期稳定运行 + 自动重启 + 输出日志（永不卡死）
CMD while true; do
  echo "====================================="
  echo "[$(date)] 启动电信流量监控服务..."
  echo "====================================="
  ./China_Telecom_Monitor_amd64 \
    --port 8081 \
    --username "$USERNAME" \
    --password "$PASSWORD" \
    --dev true
  echo "====================================="
  echo "[$(date)] 服务异常，2秒后自动重启..."
  echo "====================================="
  sleep 2
done
