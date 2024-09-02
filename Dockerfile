# 기본 Ubuntu 이미지를 사용
FROM ubuntu:latest

# 필요한 패키지 설치
RUN apt-get update && apt-get install -y \
    cmake \
    g++ \
    make \
    libgl1-mesa-dev \
    libx11-dev

# 소스 코드 복사
COPY . /usr/src/TriggerTime

# 작업 디렉토리 설정
WORKDIR /usr/src/TriggerTime

# CMake로 빌드
RUN cmake .
RUN make

# 게임 서버 실행
CMD ["./TriggerTime"]
