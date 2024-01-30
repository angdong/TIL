# Store remote state
기존 상태(2_build.md) 에서 진행


## Prerequisite
이미 이전 챕터의 인스턴스 예시 생성

## Terraform cloud setup
[Terraform cloud 회원가입 진행](https://app.terraform.io/signup/account)

`main.tf` 내에 `cloud` block 추가

Terraform cloud에서 조직 생성
```
terraform {
  cloud {
    organization = "ORGANIZATION_NAME"        # 실제 존재하는 조직명으로 설정
    workspaces {
      name = "WORKSPACE_NAME"
    }
  }
}
```

## Login to Terraform Cloud
```
$ terraform login
```
생성(Terraform cloud에서)된 API 키 입력하기

## Initialize Terraform
```
$ terraform init
```
이제 테라폼의 상태 파일이 Terraform Cloud로 옮겨갔으므로, 로컬 상태 파일 삭제해도 됨.

$\to$ 이 경우, 원격 실행 모드를 사용한다는 것
```
$ rm terraform.tfstate
```

## Set workspace variables
해당하는 workspace들어간 뒤 `Variables` 설정 페이지로 접근

환경 변수 및 Sensitive 옵션으로 두 변수 등록
1. `AWS_ACCESS_KEY_ID`
2. `AWS_SECRET_ACCESS_KEY`

## Apply & Destroy
```
$ terraform apply
```
$\to$ 이제 Terraform은 Cloud에서 상태를 저장하게 됨

```
$ terraform destroy
```