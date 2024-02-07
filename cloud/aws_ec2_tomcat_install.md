# EC2에 tomcat 설치

[자바 설치](./aws_ec2_java_install.md)

```bash
mkdir /home/tomcat
cd /home/tomcat
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz
tar xvfz apache-tomcat-9.0.85.tar.gz
rm apache-tomcat-9.0.85.tar.gz

# 톰캣 설치 위치 적어줌
chmod -R 777 /etc/profile
vi /etc/profile

# 아래 내용 추가
export CATALINA_HOME=/home/tomcat

# 변경 내용 반영
source /etc/profile

# 확인
echo $CATALINA_HOME

# 톰캣 실행
cd /home/tomcat/
cd apache-tomcat-9.0.68
chmod -R 777 home/tomcat/apache-tomcat-9.0.85/bin
cd bin

./startup.sh
```