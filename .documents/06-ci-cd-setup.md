## 배포 자동화하기 CI/CD

- `CI (Continuous Integration)`: 영역별로 나눠서 개발할 때, 인터페이스 등의 충돌을 미리 발견하기 위해 매일 또는 매시간 저장소를 자동으로 필드하는 개념
- `CD (Continuous Delivery)`: 저장소 코드의 변경이 발생하면 개발 서버 또는 운영계에 자동으로 배포하는 작업

<br />

### CI/CD 구성하기

`CI/CD` 도구로 **Jenkins**가 가장 유명하지만, 이번에는 **GitHub Actions**를 통해서 구성해 본다.
<br />
프로젝트 저장소 root에 **.github/workflows** 폴더를 만들고, 다음 **deploy-main.yml** 파일을 추가한다.

```yml
name: remote ssh command for deploy

on:
  push:
    branches: [main]

jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    steps:
      - name: executing remote ssh commands using key
        uses: appleboy/ssh-action@master
        with:
          host: ${{ secrets.HOST }}
          username: ${{ secrets.USERNAME }}
          key: ${{ secrets.KEY }}
          port: ${{ secrets.PORT }}
          script: |
            ./deploy.sh
```
