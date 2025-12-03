# Baro Farm - 마이크로서비스 백엔드

Spring Boot 4.0.0 + JDK 21 기반 멀티 모듈 프로젝트

## 📦 프로젝트 구조

```
baro-farm/
├── baro-auth/                    # A. 인증 모듈
│   └── auth-service              # 인증/인가 서비스 (JWT)
│
├── baro-buyer/                   # B. 구매자 모듈
│   ├── buyer-service             # 구매자 관리
│   ├── cart-service              # 장바구니
│   └── product-service           # 상품 관리
│
├── baro-seller/                  # C. 판매자 모듈
│   ├── seller-service            # 판매자 관리
│   └── farm-service              # 농장 관리
│
├── baro-order/                   # D. 주문 모듈
│   ├── order-service             # 주문 관리
│   └── payment-service           # 결제 처리
│
├── baro-support/                 # E. 지원 모듈
│   ├── settlement-service        # 정산 관리
│   ├── delivery-service          # 배송 관리
│   ├── notification-service      # 알림 서비스
│   ├── experience-service        # 체험 프로그램
│   ├── search-service            # 검색 서비스
│   └── review-service            # 리뷰 관리
│
└── baro-cloud/                   # F. Spring Cloud 모듈
    ├── gateway-service           # API Gateway
    ├── config-server             # 설정 서버
    └── eureka-server             # 서비스 디스커버리
```

## 🚀 기술 스택

- **Framework**: Spring Boot 4.0.0
- **Java**: JetBrains JDK 21
- **Build Tool**: Gradle 8.14
- **Spring Cloud**: 2025.0.0
  - Netflix Eureka (Service Discovery)
  - Spring Cloud Gateway
  - Spring Cloud Config
  - OpenFeign (서비스 간 통신)

## 🛠️ 개발 환경 설정

### 1. 프로젝트 클론 후 초기 설정

```bash
# 프로젝트 클론
git clone <repository-url>
cd beadv2_2_dogs_BE

# Git hooks 설치 (커밋 전 자동 검사)
./scripts/install-hooks.sh
```

### 2. 빌드

```bash
./gradlew build
```

## 🔍 코드 품질 관리

### 자동 검사 (커밋 시)

Git hooks가 설치되어 있으면 커밋할 때 자동으로 검사합니다.

### 수동 검사

```bash
# 전체 검사 (포맷 + 스타일)
./gradlew lint

# 포맷 검사만
./gradlew spotlessCheck

# 스타일 검사만 (lint)
./gradlew checkstyleMain
```

### 자동 수정

```bash
# 코드 포맷 자동 수정
./gradlew format
# 또는
./gradlew spotlessApply
```

## 🏃 서비스 실행 방법

### 서비스 실행 순서

```bash
# 1. Eureka Server (서비스 디스커버리)
./gradlew :baro-cloud:eureka-server:bootRun

# 2. Config Server (설정 서버) - 선택사항
./gradlew :baro-cloud:config-server:bootRun

# 3. Gateway Service (API Gateway)
./gradlew :baro-cloud:gateway-service:bootRun

# 4. Auth Service (인증 서비스)
./gradlew :baro-auth:auth-service:bootRun

# 5. 나머지 서비스들 (필요에 따라 실행)
./gradlew :baro-buyer:buyer-service:bootRun
./gradlew :baro-buyer:cart-service:bootRun
./gradlew :baro-buyer:product-service:bootRun
# ... 등등
```

## 🌐 서비스 포트 정보

| 모듈 | 서비스 | 포트 |
|------|--------|------|
| Cloud | eureka-server | 8761 |
| Cloud | config-server | 8888 |
| Cloud | gateway-service | 8080 |
| Auth | auth-service | 8081 |
| Buyer | buyer-service | 8082 |
| Buyer | cart-service | 8083 |
| Buyer | product-service | 8084 |
| Seller | seller-service | 8085 |
| Seller | farm-service | 8086 |
| Order | order-service | 8087 |
| Order | payment-service | 8088 |
| Support | settlement-service | 8089 |
| Support | delivery-service | 8090 |
| Support | notification-service | 8091 |
| Support | experience-service | 8092 |
| Support | search-service | 8093 |
| Support | review-service | 8094 |

## 🔗 주요 URL

- **Eureka Dashboard**: http://localhost:8761
- **API Gateway**: http://localhost:8080
- **Config Server**: http://localhost:8888

## 📋 API 경로

모든 API는 Gateway를 통해 접근합니다:

| 서비스 | 경로 |
|--------|------|
| Auth | `/api/auth/**` |
| Buyer | `/api/buyers/**` |
| Cart | `/api/carts/**` |
| Product | `/api/products/**` |
| Seller | `/api/sellers/**` |
| Farm | `/api/farms/**` |
| Order | `/api/orders/**` |
| Payment | `/api/payments/**` |
| Settlement | `/api/settlements/**` |
| Delivery | `/api/deliveries/**` |
| Notification | `/api/notifications/**` |
| Experience | `/api/experiences/**` |
| Search | `/api/search/**` |
| Review | `/api/reviews/**` |

## 🔒 인증

Gateway의 `AuthenticationFilter`에서 JWT 토큰을 검증합니다.
인증이 필요한 API 호출 시 `Authorization: Bearer {token}` 헤더가 필요합니다.

## 📝 라이선스

