### Set Variables
MAIN_PATH=$(pwd)
BUILD_PATH="docker/data/front"

### Check Arguments / $1: commit hash / $2: prod or dev
if [ $# -ne 2 ]; then
    echo 'Check Arguments'
    exit -1
fi

### Delete old files
rm -r $BUILD_PATH/*

### Download Build Files From S3
BUILD_PATH="docker/data/server"
aws s3 cp s3://soundflyer/soundflyer-deploy/front/$1.tar.gz $BUILD_PATH/$1.tar.gz

### Unzip Build Files
cd $BUILD_PATH
cat $1.tar.gz* | tar zxvf -
rm $1.tar.gz*
cd $MAIN_PATH

### Docker Compose Down
docker rm -f soundflyer-front:$2

### Docker Build
docker build --no-cache -t soundflyer-front:$2 -f docker/front.Dockerfile .

### Docker Compose Up
docker-compose up -d soundflyer-front
