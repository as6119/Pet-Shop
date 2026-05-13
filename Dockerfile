FROM tomcat:9.0-jdk17-openjdk-slim

# 톰캣 셧다운 포트를 끄고(-1), 메모리 설정을 추가합니다.
ENV JAVA_OPTS="-Dfile.encoding=UTF-8 -Dserver.xml.shutdown=-1 -Xms256m -Xmx512m"

RUN rm -rf /usr/local/tomcat/webapps/*
COPY ./Shoping /usr/local/tomcat/webapps/ROOT

# Railway는 PORT 환경변수를 사용하므로 8080을 명시적으로 노출합니다.
EXPOSE 8080

# 톰캣 실행
CMD ["catalina.sh", "run"]
