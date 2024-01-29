# ELB
하나 이상의 가용 영역에 여러 대상으로 유입되는 트래픽을 자동으로 분사하는 역할 수행

분류
* Application Load Balancer
  * OSI 7계층에서 작동
  * 사용자는 규칙을 지정하고, 규칙에 따라서 네트워크 트래픽을 분산
* Network Load Balancer
  * OSI 4계층인 네트워크에서 작동
  * 여러 가용 영역 간에 트래픽 분산
* Classic Load Balancer
  * 여러 가용 영역에서 EC2 인스턴스 트래픽 분산
  * 비정상적인 인스턴스 감지, 정상적인 인스턴스에게만 트래픽 라우팅
* Gateway Load Balancer
  * 타사 가상 어플라이언스와 통합해서 사용 가능
  * Auto Scaling 과 함께 작동, 최적화된 리소스 사용 가능