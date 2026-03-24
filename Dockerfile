FROM alpine:latest
WORKDIR /app
RUN apk add --no-cache unzip curl ca-certificates
COPY China_Telecom_Monitor_amd64.zip /app/
RUN unzip -o China_Telecom_Monitor_amd64.zip && chmod +x China_Telecom_Monitor_amd64
EXPOSE 8081
CMD /bin/sh -c 'while true; do echo "[$(date)] 启动服务..."; ./China_Telecom_Monitor_amd64 --port 8081 --username "$USERNAME" --password "$PASSWORD" --dev true; echo "[$(date)] 异常退出，2秒后重启..."; sleep 2; done'
done
