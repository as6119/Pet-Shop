# Railway에서 가장 잘 작동하는 표준 톰캣 9 이미지
FROM tomcat:9.0-slim

# 자바 내부 버그 방지 및 한글 설정
ENV JAVA_OPTS="-Dfile.encoding=UTF-8 -Djdk.lang.processReaperUseDefaultStackSize=true"

# 기존 앱 제거 및 프로젝트 복사
RUN rm -rf /usr/local/tomcat/webapps/*
COPY ./Shoping /usr/local/tomcat/webapps/ROOT

EXPOSE 8080

CMD ["catalina.sh", "run"]
