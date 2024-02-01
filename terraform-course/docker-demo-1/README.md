```bash
git clone https://github.com/wardviaene/docker-demo.git
cd docker-demo
docker build -t ${myapp-repository-URL}:1 . # version 1 명시 

docker push ${myapp-repository-URL}:1 # 빌드된 이미지를 ECR로 푸시
```