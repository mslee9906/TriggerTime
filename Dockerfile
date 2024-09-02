# 기본 Ubuntu 이미지를 사용
FROM ubuntu:latest

# 필요한 패키지 설치
RUN apt-get update && apt-get install -y \
    cmake \
    g++ \
    make \
    libgl1-mesa-dev \
    libx11-dev \
    libxxf86vm-dev \
    libglew-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# 작업 디렉토리 설정
WORKDIR /usr/src/TriggerTime

# 소스 코드 복사
COPY . /usr/src/TriggerTime

# 빌드 과정
RUN cmake . && make

# 애플리케이션 실행 명령어
CMD ["./tt"]
