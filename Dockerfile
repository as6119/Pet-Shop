# 가장 오류가 적은 자바 8 환경으로 복구
FROM tomcat:9.0-jre8-openjdk-slim

ENV JAVA_OPTS="-Dfile.encoding=UTF-8"

RUN rm -rf /usr/local/tomcat/webapps/*

# 실제 소스 위치의 내용물만 ROOT로 복사
COPY ./Shoping/src/main/webapp/ /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080
CMD ["catalina.sh", "run"]
