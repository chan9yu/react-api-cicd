## EC2 서버 인스턴스 생성

> EC2 (Elastic Compute Cloud)란?
> <br />
> AWS의 가상 서버 서비스로, 유연한 클라우드 컴퓨팅 환경을 제공

---

### 1. EC2 인스턴스 생성 과정

1. AWS 로그인
   - [AWS](https://aws.amazon.com/ko)에 로그인한다.
2. EC2 검색 및 인스턴스 생성
   - AWS 콘솔에서 `EC2` 검색 -> **Launch Instance** 클릭
3. 인스턴스 이미지 선택 (AMI)
   - **Amazon Linux 2 AMI (HVM), 64-bit (x86)** 선택
   - 2023년 3월 15일 출시된 Amazon Linux 2023 (AL2023) AMI가 기본으로 설정되어 있을 수 있다.
   - ⚠️ AL2023 변경점:
     - HTTPS 설정 추가
     - `amazon-linux-extras` 명령이 제거됨
     - 새로운 패키지 매니저 **dnf** 사용
4. 인스턴스 타입 선택
   - **t2.micro**: CPU 1개, RAM 1G 사양
     - 최초 1년간 매달 750시간 **무료로 사용 가능**하다.
     - 1년 또는 3년의 약정인 예약 인스턴스(Reserved Instance)를 지정할 경우 비용은 절반 정도로 줄일 수 있다.
5. 스토리지 추가 (Add Storage)
   - 기본값을 **30GB**로 수정 (30GB까지 무료 제공)
6. 보안 그룹 설정 (Configure Security Group)
   - **Security Group Name**: 의미 있는 이름으로 변경
   - **Add Rule** 버튼으로 80, 443 포트 추가 (HTTP, HTTPS 트래픽 허용)
   - **Review and Launch** 클릭으로 다음 단계로 이동
7. 키 페어 생성 (Key Pair)
   - Key Pair 생성 후, 개인 키 파일(Private Key)을 다운로드
   - ⚠️ Key Pair 주의사항:
     - 키 파일은 한 번만 다운로드 가능하므로 안전한 위치에 백업해야 한다.
     - 키 파일을 분실하면 인스턴스에 접근할 수 없음
   - Launch Instances 클릭으로 인스턴스를 생성

---

### 2. 인스턴스 세부 정보 확인

만들어진 인스턴스 아이디 링크를 클릭하면 하단에 Public IP를 복사할 수 있다.

> **172로 시작하는 IP**는 내부 IP로, 외부 접근이 불가능하며 동일 네트워크 내의 다른 인스턴스에서만 접근 가능하다.

---

### 3. SSH 접속

다운로드 받은 key는 사용자 홈 디렉토리에 keys 폴더를 만들어 이동하고 권한을 400으로 수정한다.

```bash
mkdir ~/keys
mv ~/Downloads/react-api-server.pem ~/keys
chmod 400 ~/keys/react-api-server.pem
```
