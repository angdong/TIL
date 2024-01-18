# Terraform
- [Terraform](#terraform)
  - [Build infrastructure](#build-infrastructure)
    - [설정 파일 작성](#설정-파일-작성)
    - [Init](#init)
    - [Format and validate config](#format-and-validate-config)
    - [Create infra](#create-infra)

## Build infrastructure
AWS 연결을 위해 아래와 같이 환경 세팅

```bash
$ export AWS_ACCESS_KEY_ID=
$ export AWS_SECRET_ACCESS_KEY=
```

### 설정 파일 작성

**Terraform configuration**\
테라폼의 인프라를 정의하는 파일들

각 테라폼 config는 독립된 작업 영역에 있어야 함\
config 위한 디렉토리 새로 만들기

```bash
$ mkdir learn-terraform-aws-instance
$ cd learn-terraform-aws-instance

# create file to define infra
$ touch main.tf
```

이후 config 파일에 아래 붙여넣기

```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
```

region과 이름 등등은 각자 변경

`terraform {}`
* 테라폼 세팅 담겨 있음
* `source`: (Optional) hostname, namespace, [provider type](https://registry.terraform.io/browse/providers)
* `version`: (Optional) 버전 명시, 명시 안할시 테라폼이 최신으로 설치

`provider`
* provider 설정(위 경우에는 aws)

`resource`
* infra의 구성 요소 정의 위함
* resource는 physical or virtual component 가능
* resource block의 두 string $\to$ resource type & name

### Init
```bash
$ terraform init
```

테라폼이 `aws` provider를 다운받음

### Format and validate config
`terraform fmt`: 가독성과 일관성을 위해 config 업데이트

```bash
$ terraform fmt
```

`terraform validate`: chekc valid syntactically & internally consistent

```bash
$ terraform validate
Success! The configuration is valid.
```

### Create infra
[link](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-build)