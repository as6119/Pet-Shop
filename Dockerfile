# 명칭이 정확한 최신 안정화 이미지로 변경
FROM tomcat:9.0.89-jdk17-slim

# 자바 버그 무시 옵션 강제 주입
ENV JAVA_OPTS="-Dfile.encoding=UTF-8 -Djdk.lang.processReaperUseDefaultStackSize=true"

RUN rm -rf /usr/local/tomcat/webapps/*
COPY ./Shoping /usr/local/tomcat/webapps/ROOT

EXPOSE 8080
CMD ["catalina.sh", "run"]
