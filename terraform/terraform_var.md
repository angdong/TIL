# 테라폼 변수 정의

## 종류
* Primitive Types
  * string
  * number
  * bool
* Collection Types
  * list
  * map
  * set
* Structural Types
  * object
  * tuple

### 예시
```
variable "name" {
    type = string
    description = "var String"
    default = "myString"
}

variable "string" {
    type = string
    description = "var String"
    default = "myString"
}

variable "number" {
    type = number
    default = "123"
}

variable "boolean" {
    default = true
}

variable "list" {
    default = [
        "google",
        "vmware",
        "amazon",
        "microsoft"
    ]
}

output "list_index_0" {
  value = var.list.0
}

output "list_all" {
  value = [
    for name in var.list :
        upper(name)
  ]
}

variable "map" {				# Sorting
    default = {
        aws = "amazon",
        azure = "microsoft",
        gcp = "google"
    }
}

output "map" {
  value = var.map.aws
}
  
variable "set" {				# Sorting
    type = set(string)
    default = [
        "google",
        "vmware",
        "amazon",
        "microsoft"
    ]
}

output "set" {
  value = var.set
}

variable "object" {
    type = object({name=string, age=number})
    default = {
        name = "abc"
        age = 12
    }
}

variable "tuple" {
    type = tuple([string, number, bool])
    default = ["abc", 123, true]
}
```

### Ordering
변수를 선언하는 방식은 여러가지지만 각 우선순위 있기 때문에 설정 유의해야 함\
아래 순서대로 마지막에 정의된 변수가 위의 설정 값 덮어 씀

1. 환경 변수
2. terraform.tfvars
3. terraform.tfvars.json
4. *.auto.tfvars/ *.auto.tfvars.json
5. 명령 줄 상의 -var 혹은 -var-file