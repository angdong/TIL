# Query data with outputs
기존에 생성한 `*.tf` 파일들에 새로 `outputs.tf` 생성

## config
`outputs.tf`
```
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}
```

```
$ terraform apply
```

## query 수행
```
$ terraform output
instance_id = "i-0bf954919ed765de1"
instance_public_ip = "54.186.202.254"
```
```
$ terraform output instance_id
"i-0bf954919ed765de1"
```