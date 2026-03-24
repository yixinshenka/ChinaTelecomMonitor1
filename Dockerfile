FROM alpine:latest
WORKDIR /app

# 安装 unzip 和 curl（解决解压和 curl 依赖问题）
RUN apk add --no-cache unzip curl

# 复制并解压 zip 文件
COPY China_Telecom_Monitor_amd64.zip /app/
RUN unzip China_Telecom_Monitor_amd64.zip && chmod +x China_Telecom_Monitor_amd64

EXPOSE 8080
CMD ["./China_Telecom_Monitor_amd64", "--port", "8080", "--dev", "true"]
