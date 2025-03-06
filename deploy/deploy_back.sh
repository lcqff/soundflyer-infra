### Check Arguments / $1: Commit ID, $2: prod or dev
if [ $# -ne 2 ]; then
    echo 'Check Arguments'
    exit -1
fi

# jar 파일 다운로드
BUILD_PATH="docker/data/server"
aws s3 cp s3://soundflyer/soundflyer-deploy/$1.jar $BUILD_PATH/MusicPlatform-0.0.1-SNAPSHOT.jar 

# 기존 Jar 삭제
if [ -d $BUILD_PATH/*.jar ]
then
    rm -r *.jar
fi

#기존 컨테이너 삭제
docker rm -f soundflyer-back:$2

# dockerfile 빌드
docker build --no-cache -t soundflyer-back:$2 -f docker/back.Dockerfile ~

# docker-compose 실행
docker-compose up -d soundflyer-back

# Cleanup
docker rmi $(docker images --filter "dangling=true" -q)
