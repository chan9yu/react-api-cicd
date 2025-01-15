## 배포 자동화하기 CI/CD

- `CI (Continuous Integration)`: 개발 과정에서 코드 충돌을 예방하기 위해 주기적으로 저장소를 자동 빌드 및 테스트
- `CD (Continuous Delivery)`: 저장소의 코드 변경 시 자동으로 서버에 배포

<br />

### 배포 스크립트 작성하기

프로젝트 루트 경로에 **scripts/deploy.sh** 파일을 생성한다.
<br />
이 스크립트는 `GitHub Actions`로 main 브랜치 변경 시 최신 코드를 자동으로 서버에 배포, 빌드, 실행한다.

scripts/deploy.sh

```bash
#!/bin/bash

npm -g install yarn

source ~/.bash_profile
cd ~/git/react-api-cicd/
git pull origin main

# front-end
cd frontend/
yarn install
yarn build
cp -rf dist/* ../backend/public

# back-end
cd ../backend/
yarn install

# pm2
pm2 stop react-api-cicd
pm2 start bin/www --name react-api-cicd --update-env
sleep 2
pm2 list
```

<br />

실행 권한 부여

```bash
chmod ./scripts/deploy.sh
```

<br />

코드를 Github에 Push한 후, SSH로 접속한 서버에서 **git pull origin main** 명령어를 실행하여 변경 사항을 반영한다.

<br />

### GitHub Actions 구성하기

`CI/CD` 도구로 **Jenkins**가 가장 유명하지만, 이번에는 **GitHub Actions**를 통해서 구성해 본다.
<br />
프로젝트 루트 경로에 **.github/workflows/deploy-main.yml** 파일을 만들고 아래 내용을 추가한다.

```yml
name: Deploy on push to main

on:
  push:
    branches: [main]

jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    steps:
      # 레포지토리 체크아웃
      - name: Checkout repository
        uses: actions/checkout@v2

      # SSH를 사용하여 스크립트 실행
      - name: executing remote ssh commands using key
        uses: appleboy/ssh-action@master
        with:
          host: ${{ secrets.HOST }}
          username: ${{ secrets.USERNAME }}
          key: ${{ secrets.KEY }}
          port: ${{ secrets.PORT }}
          script: |
            ./git/react-api-cicd/scripts/deploy.sh
```

<br />

### Secrets 설정

GitHub에서 프로젝트 레포지토리의 **Settings > Secrets > Actions**로 이동하여 다음 항목을 추가한다.

- `HOST`: 서버 도메인
- `USERNAME`: ec2-user
- `KEY`: react-api-cicd-kp.pem 파일 내용
- `PORT`: 22
