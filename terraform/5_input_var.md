# Define input variables

* `variables.tf` 파일 생성
```
variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

```

## config 수정
* `main.tf` 내에 `aws_instance` 리소스 수정
```
resource "aws_instance" "app_server" {
  ami           = "ami-02d081c743d676996"
  instance_type = "t2.micro"

  tags = {
-    Name      = "ExampleAppServerInstance"
+    Name      = var.instance_name
    Schedule  = "off-at-20"
  }
}
```

```
$ terraform apply
```

## 명령어로 수행
```
$ terraform apply -var "instance_name=YetAnotherName"
```
$\to$ 인스턴스 이름 변경