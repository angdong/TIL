```bash
git clone https://github.com/wardviaene/docker-demo.git
cd docker-demo
git remote remove origin # 원격 연결 삭제

# 현재 레포에 파일 복사
cp ../app/config/* # appspec.yaml / buildspec.yml
cp ../app/scripts/create-new-task-def.sh .

# codecommit 레포의 url로 원격 연결
git remote add origin ssh://${public id in codecommit}@git-codecommit~~
```