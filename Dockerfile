# 가장 표준적인 톰캣 9 + 자바 11 이미지 사용
FROM tomcat:9.0-jdk11-openjdk-slim

# 자바 내부 버그 방지 및 한글 설정
ENV JAVA_OPTS="-Dfile.encoding=UTF-8 -Djdk.lang.processReaperUseDefaultStackSize=true"

# 기존 앱 제거 및 프로젝트 복사
RUN rm -rf /usr/local/tomcat/webapps/*
COPY ./Shoping /usr/local/tomcat/webapps/ROOT

EXPOSE 8080

CMD ["catalina.sh", "run"]
