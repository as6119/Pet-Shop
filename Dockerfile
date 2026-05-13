# 기존의 jre8 대신 jdk21 버전으로 변경합니다.
FROM tomcat:9.0-jdk21-openjdk-slim

ENV JAVA_OPTS="-Dfile.encoding=UTF-8"

RUN rm -rf /usr/local/tomcat/webapps/*

# 실제 소스 위치의 내용물만 ROOT로 복사
COPY ./Shoping/src/main/webapp/ /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080
CMD ["catalina.sh", "run"]
