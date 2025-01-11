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

## 🗂️ 배포 프로세스

1. [EC2 서버 인스턴스 생성](./__documents__/01-ec2-instance-setup.md)
   <br />
   EC2 인스턴스를 생성하고 초기 설정을 진행
1. [git, node.js 설치](./__documents__/02-git-nodejs-setup.md)
   <br />
   서버에 git과 Node.js를 설치
1. [nginx 설치와 node.js 연결](./__documents__/03-nginx-nodejs-connection.md)
   <br />
   nginx를 설정하고 Node.js와 연동
1. [프로젝트 빌드와 실행](./__documents__/04-project-build-run.md)
   <br />
   프로젝트를 빌드하고 배포
