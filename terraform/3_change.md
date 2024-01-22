# Change infrastructure
terraform2.md 에서 만든 인프라를 변경해보기([링크](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-change))

* EC2 생성
```
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-northeast-2"
  access_key = "MY_KEY"
  secret_key = "MY_SECRET"
}

resource "aws_instance" "app_server" {
  ami           = "ami-04ab8d3a67dfe6398"
  instance_type = "t2.micro"

  tags = {
    Name     = "ExampleAppServerInstance"
    Schedule = "off-at-20"
  }
}
```
```
$ terraform init
$ terraform apply
```


* 이후 AMI 변경해보기
```
resource "aws_instance" "app_server" {
  ami           = "ami-02d081c743d676996"                # 변경됨
  instance_type = "t2.micro"

  tags = {
    Name     = "ExampleAppServerInstance"
    Schedule = "off-at-20"
  }
}
```

```
$ terraform apply
```
$\to$ AMI가 정상적으로 변경된다