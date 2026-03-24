FROM alpine:latest
WORKDIR /app
RUN apk add --no-cache unzip curl
# 复制你仓库里的zip包
COPY China_Telecom_Monitor_amd64.zip .
# 解压，然后打印解压后的文件，确认二进制文件存在
RUN unzip -o China_Telecom_Monitor_amd64.zip && ls -la && chmod +x China_Telecom_Monitor_amd64
EXPOSE 8081
# 调试用的启动命令：打印所有信息，看看到底卡在哪
CMD /bin/sh -c '
echo "=== 当前目录文件列表 ==="
ls -la
echo "=== 检查二进制文件权限 ==="
ls -l China_Telecom_Monitor_amd64
echo "=== 检查环境变量 ==="
echo "USERNAME: $USERNAME"
echo "PASSWORD: $PASSWORD"
echo "=== 开始启动程序 ==="
./China_Telecom_Monitor_amd64 --port 8081 --username "$USERNAME" --password "$PASSWORD" --dev true
echo "=== 程序异常退出，错误码: $? ==="
sleep 30
'
