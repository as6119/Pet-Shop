# 톰캣 9와 자바 11 조합으로 변경 (안정성이 더 높습니다)
FROM tomcat:9.0-jdk11-openjdk-slim

# 기존 앱 제거
RUN rm -rf /usr/local/tomcat/webapps/*

# 폴더명 대소문자 주의! 깃허브 폴더명이 Shoping이므로 그대로 기재합니다.
COPY ./Shoping /usr/local/tomcat/webapps/ROOT

# 톰캣의 한글 깨짐 방지 설정 (필요 시)
ENV JAVA_OPTS="-Dfile.encoding=UTF-8"

EXPOSE 8080
CMD ["catalina.sh", "run"]
