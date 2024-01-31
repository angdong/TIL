## `aws_autoscaling_group`

* 계정 설정상 EC2에 `Schedule` 태그를 부여해줘야 했음\
  예) `Schedule = "off-at-20"`

* aws_autoscaling_group 에 Schedule 태그를 삽입하는 방법은 아래와 같음

resource "aws_autoscaling_group" "example-autoscaling" {\
&nbsp;&nbsp;name = "example-autoscaling"\
&nbsp;&nbsp;vpc_zone_identifier       = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id]\
&nbsp;&nbsp;launch_configuration  = aws_launch_configuration.example-launchconfig.name\
&nbsp;&nbsp;min_size                  = 1\
&nbsp;&nbsp;max_size                  = 2\
&nbsp;&nbsp;health_check_grace_period = 300\
&nbsp;&nbsp;health_check_type         = "EC2"\
&nbsp;&nbsp;force_delete              = true # 오토스케일링 그룹에서 빠지면 자동으로 삭제

&nbsp;&nbsp;tag {\
&nbsp;&nbsp;&nbsp;&nbsp;key                 = "Name"\
&nbsp;&nbsp;&nbsp;&nbsp;value               = "ec2 instance"\
&nbsp;&nbsp;&nbsp;&nbsp;propagate_at_launch = true\
&nbsp;&nbsp;}\
<span style=color:yellow>&nbsp;&nbsp;tag {\
&nbsp;&nbsp;&nbsp;&nbsp;key                 = "Schedule"\
&nbsp;&nbsp;&nbsp;&nbsp;value               = "off-at-20"\
&nbsp;&nbsp;&nbsp;&nbsp;propagate_at_launch = true\
&nbsp;&nbsp;}\
</span>
}