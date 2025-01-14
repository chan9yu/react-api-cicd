# react-api-cicd

> 📦 **React + API Server 프로젝트 개발과 배포 (CI/CD)**

React와 Node.js에 대한 개발환경 구축과 배포에 대해 정리합니다.

<br />

## 🛠️ 로컬 개발서버

- **Front-end**: http://localhost:3000/
- **Back-end**: http://localhost:4000/
- **API Docs**: http://localhost:4000/api-docs/

### 실행 방법

1. **Front-end**:

   ```bash
   cd frontend
   yarn install
   yarn dev
   ```

2. **Back-end**:

   ```bash
   cd backend
   yarn install
   yarn dev
   ```

<br />

## 🗂️ Documents

### 배포 프로세스

1. [EC2 서버 인스턴스 생성](./__documents__/01-ec2-instance-setup.md)
1. [Git, Node.js 설치](./__documents__/02-git-nodejs-setup.md)
1. [Nginx 설치와 Node.js 연결](./__documents__/03-nginx-nodejs-connection.md)
1. [프로젝트 빌드와 실행](./__documents__/04-project-build-run.md)

### 기타 설정

1. [HTTPS 설정](./__documents__/05-https-setup.md)
1. [배포 자동화하기 CI/CD](./__documents__/06-ci-cd-setup.md)
1. [CORS 설정과 환경변수](./__documents__/07-cors-and-env-setup.md)
