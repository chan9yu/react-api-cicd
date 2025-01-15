## 프로젝트 빌드와 실행

서버에서는 React 애플리케이션을 빌드한 후, 결과물을 **backend/public** 경로로 복사하여 API 서버와 함께 실행한다.
<br />
이를 위해 [pm2](https://pm2.keymetrics.io/)를 사용해 Node.js 서버를 관리한다.

<br />

### 1. pm2 설치

```bash
npm install -g pm2
```

<br />

### 2. 프로젝트 다운로드 및 빌드

```bash
mkdir ~/git
cd ~/git
git clone https://github.com/chan9yu/react-api-cicd.git
cd react-api-cicd/frontend/
npm i
npm run build
cp -rf dist/* ../backend/public
```

<br />

### 3. Node.js 서버 실행

```bash
cd ../backend/
npm i
pm2 start bin/www --name react-api-cicd
pm2 list
```
