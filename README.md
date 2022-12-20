# UyuniSuite Deploy

[Kustomize](https://kubectl.docs.kubernetes.io/guides/)를 이용하여 UyuniSuite 배포

## 디렉토리 구조
```
├── base -> base가 되는 매니패스트 파일들이 들어 있는 폴더
│   ├── configmaps -> mariadb, nginx web proxy설정이 들어있는 폴더
│   ├── deployments -> 우유니 스위트 모듈들을 배포할 수 있는 쿠버네티스 deployment가 들어있는 폴더
│   ├── secrets -> harbor접속 .dockerconfig secret파일 들어있음.
│   ├── services -> 우유니 스위트 쿠버네티스 서비스 파일 들어있는 폴더.
│   └── volumes -> 우유니 스위트에서 사용하는 pvc, pv 들어 있는 폴더.
└── overlays -> 각 환경별로 다르게 배포할 수 있는 폴더
    ├── develop -> 우유니 스위트 develop 환경 배포
    ├── katech 
    └── stage -> 우유니 스위트 staging 환경 배포
```

## 명령어
### build 명령어
```
 kustomize build <각 환경에 대한 kustomize.yalm파일이 있는 경로>
 ex) kustomize build overlays/stage
```

### build와 쿠버네티스 배포까지 동시에 진행
```
kustomize build <각 환경에 대한 kustomize.yalm파일이 있는 경로> | kubectl apply -f -
ex) kustomize build overlays/stage | kubectl apply -f -
```

## 주의사항
* 환경별 폴더에 쿠버네티스를 제어할 수 있는 config파일이 존재해야 함.
