
FROM tomcat:9.0-jdk17-openjdk-slim

# 기존 톰캣 앱 제거
RUN rm -rf /usr/local/tomcat/webapps/*

# 프로젝트의 소스가 들어있는 폴더(webapp)를 톰캣의 실행 경로로 복사
COPY ./Shoping /usr/local/tomcat/webapps/ROOT

EXPOSE 8080
CMD ["catalina.sh", "run"]
