# JDK 스테이징 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
FROM openjdk:11-jre-slim
WORKDIR /app

COPY --from=build /app/build/libs/*.jar /app/soundflyer.jar

ENTRYPOINT [ \
    "java", \
    "-Dspring.profiles.active=dev", \
    "-Duser.timezone=Asia/Seoul", \
    "-jar", \
    "soundflyer.jar" \
]
