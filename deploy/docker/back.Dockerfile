# JDK 스테이징 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
FROM openjdk:17-jdk-slim
WORKDIR /app

COPY docker/data/server/dependencies .
COPY docker/data/server/spring-boot-loader .
COPY docker/data/server/snapshot-dependencies .
COPY docker/data/server/application .

ENTRYPOINT [ \
    "java", \
    "-Dspring.profiles.active=dev", \
    "-Duser.timezone=Asia/Seoul", \
    "org.springframework.boot.loader.launch.JarLauncher" \
]
