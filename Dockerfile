FROM tomcat:9.0-jre8-openjdk-slim

ENV JAVA_OPTS="-Dfile.encoding=UTF-8"

RUN rm -rf /usr/local/tomcat/webapps/*

# 실제 소스 위치(src/main/webapp)의 내용물을 ROOT로 복사합니다.
COPY ./Shoping/src/main/webapp/ /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080
CMD ["catalina.sh", "run"]
