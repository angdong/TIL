# terraform backend s3 정의 넣음
terraform {
    backend "s3" {
        bucket = "terraform-state-f13c1"
        key = "terraform/demo4"
        region = "ap-northeast-2"
    }
}