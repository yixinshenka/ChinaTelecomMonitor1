FROM alpine:latest
WORKDIR /app
RUN apk add --no-cache unzip curl
COPY China_Telecom_Monitor_amd64.zip .
RUN unzip -o China_Telecom_Monitor_amd64.zip && chmod +x China_Telecom_Monitor_amd64

# 👇 这两个是 Render 强制要求 10000
EXPOSE 10000
CMD ["./China_Telecom_Monitor_amd64", "--port", "10000", "--username", "$USERNAME", "--password", "$PASSWORD", "--dev", "true"]
