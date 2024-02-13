# S3와 CloudFront 연결

1. S3 생성(퍼블릭 허용 및 ACL 활성화)
2. S3 정적 웹 사이트 생성(안해도 되는지는 몰루)
3. S3 정책에 모든 public 접근 허용 -> public 버킷이 됨
4. CloudFront 생성
   1. 원본 도메인 S3 연결
   2. 원본 액세스 > 원본 액세스 제어 설정 후 OAC 생성\
        이 경우, 제어 설정의 이름은 원본 도메인과 일치해야 함
   3. 생성된 cloudfront 원본 정책 복사
   4. cloudfront 에서 복사한 정책을 S3에 붙여 넣기