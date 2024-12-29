# react-api-cicd

📦 **React + API Server 프로젝트 개발과 배포 (CI/CD)**

<br />

## 로컬 개발서버

- **Frontend**: http://localhost:3000/
- **Backend**: http://localhost:4000/
- **API Docs**: http://localhost:4000/api-docs/

### 실행 방법

1. **Frontend**:

   ```bash
   cd frontend
   yarn install
   yarn dev
   ```

2. **Backend**:

   ```bash
   cd backend
   yarn install
   yarn dev
   ```

<br />

## 배포 프로세스

- EC2 서버 인스턴스 생성
- git, node.js 설치
- nginx 설치와 node.js 연결
- 프로젝트 빌드와 실행
