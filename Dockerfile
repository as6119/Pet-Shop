# 호환성 문제가 거의 없는 자바 8 버전의 톰캣 사용
FROM tomcat:9.0-jre8-openjdk-slim

# Railway 환경에서 발생할 수 있는 메모리 체크 버그 방지 옵션
ENV JAVA_OPTS="-Dfile.encoding=UTF-8"

# 기존 앱 제거 및 내 프로젝트(Shoping)를 ROOT로 복사
RUN rm -rf /usr/local/tomcat/webapps/*
COPY ./Shoping /usr/local/tomcat/webapps/ROOT

# 포트 개방
EXPOSE 8080

# 실행
CMD ["catalina.sh", "run"]
