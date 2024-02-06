# 테라폼 모듈이란?

## 정의
관련있는 리소스를 모아서 하나의 패키지를 만들어 사용

복잡한 인프라 구조 쉽게 관리, 재사용할 수 있도록 만드는 테라폼의 핵심 기능

### 장점
1. 캡슐화\
   연관 있는 리소스들을 모아서 결합시키고 필요한 인자들만 넘겨주므로 실제 구현에 대해서는 몰라도 됨
2. 재사용성\
   한번 정의해둔 모듈은 여러번 호출될 수 있으므로 리소스 쉽게 재사용 가능
3. 일관성\
   모듈화를 통해 리소스에 필요한 옵션들 미리 정의 가능하므로 빠지는 옵션 없이 리소스 생성 가능

### 사용방법
1. 리소스 정의
```
# module/eip/eip.tf

resource "aws_eip" "this" {
  vpc = true
  instance = var.instance_id
  network_interface = var.network_interface_id
}

resource "aws_eip_association" "this" {
  allocation_id = aws_eip.this.allocation_id
  instance_id = var.instance_id
  network_interface_id = var.network_interface_id
}
```

모듈을 정의하며, 필요한 옵션 값들은 모두 변수로 작성

2. 설정값 정의
   
변수로 대체했던 값들을 `variables.tf` 에 빈 블럭으로 정의\
Optional로 정의하고 싶으면 default 값으로 null 넣기

```
# modules/eip/variables.tf

variable instance_id {}
variable network_interface_id {}
```

3. 모듈 호출

앞서 정의한 모듈 호출\
모듈 호출시에 `variable.tf` 에 정의된 값들 넘겨줌

모듈을 호출하고 있는 파일의 위치를 기준으로 모듈의 상대 경로를 `source` 에 명시

```
# dev/eip/eip.tf

module eip {
	source = "../../modules/eip"
	
    instance_id = "instance_id"
    network_interface_id = "network_interface_id"
}
```

이후 `terraform init` 을 실행시켜 모듈을 다운로드 받으면 테라폼이 최신 상태의 모듈 참조 가능

### output 블럭
모듈에서 output 정의하면 루트 모듈에서 활용 가능

```
modules/eip/outputs.tf

output "id" {
    value = aws_eip.this.id
}
```

```
dev/eip/eip.tf

...생략...

	eip_id = module.eip.id
    
...생략...
```

### 주의사항
**하나의 디렉터리에는 한 개의 리소스 파일만 위치하도록 하기**

## 구조
테라폼 모듈의 일반적인 구조

|||
|-|-|
|`main.tf`|모듈의 주요 리소스와 구성 정의|
|`variables.tf`|모듈이 사용하는 변수들 정의|
|`outputs.tf`|모듈에서 생성된 리소스의 출력값(리소스 ID, IP주소 등) 정의|
|`README.md`|모듈의 사용 방법과 목적 설명하는 문서|

```
Terraform Module
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md
```

* 테라폼에서 제공하는 표준 모듈

```
Terraform Module (루트 모듈)
└── main.tf
└── modules/
    ├── ec2_instance (서브 모듈1)
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── load_balancer (서브 모듈2)
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
...
```



[참고]

[[Terraform] module이란? 사용법 및 작성 팁](https://velog.io/@newdana01/Terraform-module%EC%9D%B4%EB%9E%80-%EC%82%AC%EC%9A%A9%EB%B2%95-%EB%B0%8F-%EC%A3%BC%EC%9D%98%EC%82%AC%ED%95%AD)


[실전! 테라폼 정복기 1편 - 테라폼(Terraform) 모듈화](https://curiousjinan.tistory.com/entry/terraform-modularization-guide)