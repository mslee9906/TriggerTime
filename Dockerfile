# 베이스 이미지로 Ubuntu 사용
FROM ubuntu:latest

# 필요한 패키지 설치
RUN apt-get update && apt-get install -y \
    cmake \
    gcc \
    g++ \
    make \
    git \
    libsdl2-dev \
    libpng-dev \
    && rm -rf /var/lib/apt/lists/*

# 작업 디렉토리 설정
WORKDIR /usr/src/doom

# 소스 코드 복사
COPY . .

# CMake를 사용해 빌드 설정
RUN cmake .

# 빌드 실행
RUN make

# 포트 열기 (예시, 필요에 따라 조정)
EXPOSE 8080

# 실행 명령 설정 (필요에 따라 수정)
CMD ["./doom"]
