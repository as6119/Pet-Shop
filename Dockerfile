# 자바 17 버전으로 변경 (컴파일 버전과 맞추기 위함)
FROM tomcat:9.0-jdk17-openjdk-slim

ENV JAVA_OPTS="-Dfile.encoding=UTF-8 -Djdk.lang.processReaperUseDefaultStackSize=true"

RUN rm -rf /usr/local/tomcat/webapps/*
COPY ./Shoping/src/main/webapp/ /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080
CMD ["catalina.sh", "run"]
