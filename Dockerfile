# 버그가 해결된 최신 톰캣 9 이미지를 사용합니다.
FROM tomcat:9.0-jre11-openjdk-slim

# Railway 환경에서 발생하는 자바 컨테이너 버그를 방지하는 옵션 추가
ENV JAVA_OPTS="-Djava.util.logging.config.file=/usr/local/tomcat/conf/logging.properties -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager -Dfile.encoding=UTF-8"

# 기존 앱 제거 및 프로젝트 복사
RUN rm -rf /usr/local/tomcat/webapps/*
COPY ./Shoping /usr/local/tomcat/webapps/ROOT

# 포트 설정
EXPOSE 8080

CMD ["catalina.sh", "run"]
