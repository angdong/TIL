## userdata
AWS EC2 등 인스턴스 생성 시 자동으로 실행할 스크립트를 정의하는 부분\
주로 **초기 설정/패키지 설치 등에 사용**

AMI이미지 이용하여 인스턴스의 첫 부팅 시점에만 실행되는 것

예)

resource "aws_instance" "userdata" {\
&nbsp;&nbsp;ami           = data.aws_ami.ubuntu.image_id\
&nbsp;&nbsp;instance_type = "t2.micro"\
&nbsp;&nbsp;key_name      = "fastcampus"\

<span style=color:yellow;>&nbsp;&nbsp;user_data = <<EOT\
&nbsp;&nbsp;#!/bin/bash\
&nbsp;&nbsp;sudo apt-get update\
&nbsp;&nbsp;sudo apt-get install -y nginx\
&nbsp;&nbsp;EOT

</span>

&nbsp;&nbsp;vpc_security_group_ids = [\
&nbsp;&nbsp;&nbsp;&nbsp;module.security_group.id,\
&nbsp;&nbsp;]

&nbsp;&nbsp;tags = {\
&nbsp;&nbsp;&nbsp;&nbsp;Name = "fastcampus-userdata"\
&nbsp;&nbsp;}\
}

## provisioner
테라폼이 리소스를 생성하거나 제거한 후에 실행되는 **추가적인 도구**

종류
1. file\
   로컬 $\to$ 리모트 머신 파일 복사할 때 사용
2. local_exec\
   로컬 머신에서 명령어 수행
3. remote_exec\
   리모트 머신에서 명령어 수행
    * SSH 명령어(Unix/Linux)
    * WIN_rm2 명령어(Windows)



첫 리소스 생성 시점, 리소스 삭제 시점, 매번 수행 등 다양한 옵션을 주어서 실행 가능