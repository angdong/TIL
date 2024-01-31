output "eb" {
  # 이동할 수 있는 애플리케이션 URL
  value = aws_elastic_beanstalk_environment.app-prod.cname
}

