# nlb 생성
resource "aws_lb" "tf-nlb-was" {
  name               = "tf-nlb-was"
  internal           = true # 내부 접근
  load_balancer_type = "network"
  subnets            = [aws_subnet.tf-sub-pri-a-web.id, aws_subnet.tf-sub-pri-c-web.id] # web subnet에서 was를 바라봄
  tags = {
    Name = "tf-nlb-was"
  }
}

# 타겟그룹
# was에서 진행 될 tomcat의 경우, 8080 port로 통신된다.
resource "aws_lb_target_group" "tf-ntg-was" {
  name        = "tf-ntg-was"
  port        = "8080"
  protocol    = "TCP"
  vpc_id      = aws_vpc.tf-vpc.id
  target_type = "instance"
  tags = {
    Name = "tf-ntg-was"
  }
}

resource "aws_lb_listener" "tf-nlt-was" {
  load_balancer_arn = aws_lb.tf-nlb-was.arn
  port              = "80"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tf-ntg-was.arn
  }
}

resource "aws_lb_target_group_attachment" "tf-ntt-was1" {
  target_group_arn = aws_lb_target_group.tf-ntg-was.arn
  target_id        = aws_instance.tf-ec2-pri-a-was1.id
  port             = 8080
}
resource "aws_lb_target_group_attachment" "tf-ntt-was2" {
  target_group_arn = aws_lb_target_group.tf-ntg-was.arn
  target_id        = aws_instance.tf-ec2-pri-c-was2.id
  port             = 8080
}

# resource "aws_security_group" "tf-sg-nlb-was" {
#   name        = "tf-sg-nlb-was"
#   description = "tf-sg-nlb-was"
#   vpc_id      = aws_vpc.tf-vpc.id
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     security_groups = [
#         aws_security_group.tf-sg-pri-web.id
#     ]
#   }
#   tags = {
#     Name = "tf-sg-nlb-was"
#   }
# }