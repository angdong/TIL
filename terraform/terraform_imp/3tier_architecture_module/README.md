[사내 위키](https://wire.lgcns.com/confluence/pages/viewpage.action?pageId=550450378) 참고

# Terraform으로 3-Tier 구축

## 3 Tier

### 프리젠테이션 계층
클라이언트에게 직접 정보 제공하고 수집하는 상호작용 수행

프론트엔드
### 어플리케이션 계층
프레젠테이션 계층에서 클라이언트로부터 수집된 정보 처리

데이터 계층에 데이터 CRUD 요청하는 계층

백엔드/미들웨어
### 데이터 계층
어플리케이션 계층에서 처리하는 정보 기반으로 데이터 저장하며 관리하는 계층

## 모듈 생성
자원별로 registry에 등록된 모듈을 불러와 필요에 맞게 커스터마이징하기

예)

```
module "ALB" {
  source  = "terraform.cloudops.cloudxper.lgcns.com/lgcns/albcat/aws"
  version = "0.0.1"
  ...
}
```