# JDK 스테이징 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
FROM openjdk:17-jdk-slim
WORKDIR /app

COPY soundflyer-infra/deploy/docker/data/server/MusicPlatform-0.0.1-SNAPSHOT.jar .
COPY apm/scouter/agent.java/scouter.agent.jar .
COPY apm/scouter/agent.java/conf/scouter.conf .

ENTRYPOINT [ \
    "java", \
    "-javaagent:/app/scouter.agent.jar", \
    "-Dscouter.config=/app/scouter.conf", \
    "-Dspring.profiles.active=dev", \
    "-Duser.timezone=Asia/Seoul", \
    "-jar", \
    "MusicPlatform-0.0.1-SNAPSHOT.jar" \
]
