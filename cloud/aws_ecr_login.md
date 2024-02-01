## CLI상에서 ecr login 방법

```bash
aws ecr get-login # v2 부터 지원 X
```

```bash
aws ecr get-login-password --region <region>
# 출력 텍스트 복사
docker login -u AWS -p <TEXT> <REPO_URL>
```