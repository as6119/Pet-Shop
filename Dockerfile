# 1. 자바 8 대신 자바 21을 지원하는 이미로 변경합니다.
FROM tomcat:9.0-jdk21-openjdk-slim

ENV JAVA_OPTS="-Dfile.encoding=UTF-8"

RUN rm -rf /usr/local/tomcat/webapps/*

# 2. 프로젝트 소스를 복사합니다.
COPY ./Shoping/src/main/webapp/ /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080
CMD ["catalina.sh", "run"]
