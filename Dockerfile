FROM alpine:latest
WORKDIR /app
RUN apk add --no-cache unzip curl
COPY China_Telecom_Monitor_amd64.zip .
RUN unzip -o China_Telecom_Monitor_amd64.zip && chmod +x China_Telecom_Monitor_amd64
EXPOSE 8081
CMD ["./China_Telecom_Monitor_amd64", "--port", "8081", "--username", "$USERNAME", "--password", "$PASSWORD", "--dev", "true"]
