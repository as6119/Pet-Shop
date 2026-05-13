FROM tomcat:9.0-jdk11-openjdk-slim

RUN rm -rf /usr/local/tomcat/webapps/*
COPY ./Shoping /usr/local/tomcat/webapps/ROOT

# Railway 환경에서 포트를 동적으로 할당받기 위한 설정
ENV PORT 8080
EXPOSE 8080

# 톰캣의 server.xml을 수정하지 않고 포트를 강제하는 설정
CMD ["catalina.sh", "run"]
