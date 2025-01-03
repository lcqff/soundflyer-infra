# JDK 스테이징 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
FROM openjdk:17-jdk-slim
WORKDIR /app

COPY docker/data/server/MusicPlatform-0.0.1-SNAPSHOT.jar .

ENTRYPOINT [ \
    "java", \
    "-Dspring.profiles.active=dev", \
    "-Duser.timezone=Asia/Seoul", \
    "-jar", \
    "MusicPlatform-0.0.1-SNAPSHOT.jar" \
]
