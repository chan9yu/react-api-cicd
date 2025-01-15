## CORS 설정과 환경변수

> 💡 CORS(Cross-Origin Resource Sharing)
> <br />
>
> - 웹 애플리케이션이 다른 도메인에서 리소스를 요청할 때 발생하는 보안상의 문제를 해결하기 위한 메커니즘이다.
> - 예를 들어, 프론트엔드 애플리케이션이 http://localhost:3000 에서 실행 중이고, 백엔드 API 서버가 http://localhost:4000 에서 동작 중이라면,<br />이 둘은 서로 다른 도메인으로 간주되어 CORS 문제가 발생할 수 있다.

<br />

### 로컬 개발 환경에서 CORS 설정

로컬 환경에서 프론트엔드와 백엔드 간 API 호출 시 CORS 문제가 발생할 수 있다.
<br />
이를 해결하기 위해 백엔드에 CORS 설정을 추가해야 한다.

```jsx
export default function App() {
	const [data, setData] = useState("");

	useEffect(() => {
		fetch(`${import.meta.env.VITE_API_SERVER}/api/hello`)
			.then((response) => response.json())
			.then((data) => setData(JSON.stringify(data)));
	}, []);

	// ...

	return (
		// ...
		<p>
			/api/hello: <code>{data}</code>
		</p>
		// ...
	);
}
```

<br />

이 코드를 작성한 뒤 프론트엔드와 백엔드를 실행하면, 개발자 도구 콘솔에 다음과 같은 에러가 나타날 것이다

```
Access to fetch at 'http://localhost:4000/api/hello' from origin 'http://localhost:3000' has been blocked by CORS policy.
```

<br />

#### 백엔드 CORS 설정

**express.js**를 사용하는 백엔드에 CORS 설정을 추가하여 문제를 해결할 수 있다.

1. CORS 라이브러리 설치

   ```
   cd ~/git/backfront/backend
   npm install cors
   ```

2. app.js 파일 수정

   ```javascript
   const cors = require("cors");

   // ...

   app.use(cors());
   ```

3. 서버 재시작 후 확인
   ```
   npm start
   ```

<br />

### VITE 환경변수를 이용한 동적인 빌드

#### 환경별 설정의 필요성

로컬 개발 환경에서는 프론트엔드(3000 포트)와 백엔드(4000 포트)가 서로 다른 도메인에서 실행되지만, 배포 환경에서는 동일한 도메인에서 제공된다.
<br />
이를 위해 환경변수로 API 서버 주소를 동적으로 설정해야 한다.

<br />

#### 환경변수 설정

1.  로컬 환경 설정

    `frontend/.env.local` 파일을 생성하고 다음 내용을 추가한다.

    ```
    VITE_API_SERVER=http://localhost:4000
    ```

1.  코드 수정

    `frontend/src/App.tsx` 파일에서 하드코딩된 URL을 환경변수로 대체한다.

    ```jsx
    useEffect(() => {
    	fetch(`${import.meta.env.VITE_API_SERVER}/api/hello`)
    		.then((response) => response.json())
    		.then((data) => setData(JSON.stringify(data)));
    }, []);
    ```

1.  서버에서 환경변수 설정

    배포 환경에서는 `frontend/.env` 파일을 생성하고 다음 내용을 추가한다

    ```
    VITE_API_SERVER=
    ```

1.  서버 재시작

    환경변수 변경 후 서버를 재시작하여 변경 사항을 적용한다

    ```
    npm start
    ```
