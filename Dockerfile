FROM alpine:latest
WORKDIR /app
COPY China_Telecom_Monitor_amd64.tar.gz /app/
RUN tar -zxvf China_Telecom_Monitor_amd64.tar.gz && chmod +x China_Telecom_Monitor_amd64
EXPOSE 8080
CMD ["./China_Telecom_Monitor_amd64", "--port", "8080", "--dev", "true"]
