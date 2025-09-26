# ![header](https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=10&height=200&animation=twinkling&section=header&text=stock101&fontSize=50&fontAlign=75&fontAlignY=36)

# 📈Stock101 - 투자를 근거있게

## 👀목차
1. [👥팀원](#팀원)
2. [📚프로젝트 개요](#프로젝트-개요)  
	2.2 [🎯요구사항 분석](#요구사항-분석)
3. [🔧시스템 아키텍쳐](#시스템-아키텍쳐)
4. [📅요구사항 명세서](#요구사항-명세서)
5. [🪧ERD](#ERD)
6. [🗃️테이블 명세서](#테이블-명세서)
7. [🎯API 명세서](#API-명세서)
---
### 👥팀원

|👑윤석현 | 손혜원 | 박진우 | 조원석 |
| --- | --- | --- | --- |

## 📌프로젝트 개요
### 📘 프로젝트 소개

Stock101은 S&P500 상위 10개 종목을 중심으로 기업 정보 + 투자자 커뮤니티를 통합 제공하는 웹 기반 플랫폼이다.
투자자들이 “왜 이 기업이 지금 주목받는가?”를 스스로 분석하고 토론할 수 있게, 기초 재무 데이터부터 뉴스, 투자 지표, 커뮤니티 콘텐츠까지 한 곳에서 제공하는 걸 목표로 한다.
이 플랫폼이 사용자들에게 “투자의 바이블(Bible)”처럼 신뢰받는 참고 자료가 되는 게 궁극적인 목표이다.

### ✅ 왜 이 플랫폼이 필요한가?
• 정보의 편향성 극복

보통 투자자는 기관 리포트나 애널리스트 의견에 많이 의존하게 된다.
하지만 플랫폼을 통해 일반 투자자들도 기업 정보를 직접 보고 해석하고, 커뮤니티 피드백도 참고할 수 있으면 정보의 균형이 맞춰질 수 있다.

• 투자자 심리 + 시장 흐름 연결

단순히 기업의 재무만 보는 걸로는 부족하며 시장 참여자(특히 개인투자자)의 움직임이 종목 흐름을 바꾸는 경우가 잦다.
최근엔 ‘동학개미’들이 증시를 흔드는 ‘큰손’으로 불릴 정도로 영향력이 커지고 있다는 기사도 나온 적이 있다.  ￼

• 트렌드 감지 + 토론 공간 제공

어떤 뉴스나 테마가 빨리 퍼지는지, 사람들이 그걸 어떻게 해석하는지 커뮤니티에서 힌트를 얻을 수 있어야 한다.
또, 각종 지표 + 토론 + 유저 간 상호작용이 결합되면 유의미한 투자 아이디어도 나올 수 있다.

## 📑요구사항 분석
### 🔍 1. 기업 분석
- 뉴스: 종목별 뉴스 크롤링, 날짜별 조회, 인기 뉴스 강조
- 투자 지표: PER, PBR, EPS, BPS, ROE, ROA 제공
- 재무 제표: 분기/연도 기준 손익계산서, 대차대조표, 현금흐름표
- 기업 개요 및 사업 내용: 설립연도, 본사 위치, 섹터 등 정보
- 배당 정보: 최근 4분기 배당금, 배당락일, 수익률 등
- 기업 이벤트 캘린더: IR 일정, 공시 정보 통합 제공


### 📈 2. 시장 데이터
- 실시간 주가 정보: 종목별 주가 흐름 및 등락률
- 시장지표: S&P500, 다우지수 등 주요 지수 제공
- 주식 종목별 데이터 시각화: 차트/히트맵 기반 인터페이스


### 👤 3. 유저 기능
- 회원 관리: 가입, 로그인, 회원탈퇴, 인증 절차
- 사용자 정보: 개인화된 투자 성향 및 선호 설정
- 활동 내역: 댓글, 게시글, 조회 기록 등 저장
- 관심 목록 관리: 종목 즐겨찾기 및 알림 기능
- 계정 보안: 비밀번호 변경, 이중 인증 등 보안 강화


### 💬 4. 커뮤니티
- 게시판: 종목 토론, 자유게시판, Q&A 등 다양한 공간 제공
- 위키: 사용자 기반 종목/용어 설명 편집 시스템
- 외부 커뮤니티 연동: Reddit, 증권 커뮤니티 등 연계
- 관리자 컨택: 신고/문의 기능 제공
- 사용자 등급/평판 시스템: 활동 기반 등급 부여 및 뱃지 시스템

## 시연
<details><summary><strong>Overview</strong></summary>
  
<details><summary>Stock101 빠르게 살펴보기</summary>
<img src="https://github.com/user-attachments/assets/0ed82ffa-ab9b-4b2c-8a46-9bc9b6d37550" alt="살펴보기" />
</details>
</details>


<details><summary><strong>로그인/회원가입</strong></summary>
  
<details><summary>회원가입</summary>
<img src="https://github.com/user-attachments/assets/b3ee4078-2de2-4838-8de5-02fc31d6daf6" alt="회원가입" />
</details>

<details><summary>로그인</summary>
<img src="https://github.com/user-attachments/assets/e11f9460-88c0-4cfb-bfd7-1c9670832602" alt="로그인" />
</details>
</details>

<details><summary><strong>내 정보</strong></summary>
  
<details><summary>내 정보 조회 및 수정</summary>
<img src="https://github.com/user-attachments/assets/10262347-8098-44c6-abae-ab0f3e17cbd2" alt="내 정보" />
</details>

</details>
<details><summary><strong>주식 상세</strong></summary>
  
<details><summary>주식 상세 화면</summary>
<img src="https://github.com/user-attachments/assets/e287bcd5-9fc4-4eb7-a719-f2b6b9ccc055" alt="주식 상세 화면" />
</details>
</details>

</details>
<details><summary><strong>커뮤니티</strong></summary>
  
<details><summary>게시물 등록</summary>
<img src="https://github.com/user-attachments/assets/10178f01-3bf4-4b4c-b31b-5b9969fe55f8" alt="게시물 등록" />
</details>


<details><summary>게시물 좋아요</summary>
<img src="https://github.com/user-attachments/assets/6ee028e4-9408-4166-9022-0a220d5b5903" alt="게시물 좋아요" />
</details>

<details><summary>게시물 댓글 등록 및 대댓글 등록</summary>
<img src="https://github.com/user-attachments/assets/5230a957-357a-43d8-bf4c-e4b5c4fd5b7d" alt="게시물 댓글 등록 및 대댓글 등록" />
</details>

</details>
<details><summary><strong>예측</strong></summary>
  
<details><summary>예측 등록</summary>
<img src="" alt="예측 등록" />
</details>


<details><summary>다른 사용자 예측 조회</summary>
<img src="" alt="다른 사용자 예측 조회" />
</details>

</details>



## 🔧시스템 아키텍쳐
<img width="1230" height="589" alt="image" src="https://github.com/user-attachments/assets/6e3f05f9-6da1-4aca-a291-7c222b48f2f7" />


## [📋요구사항 명세서](https://docs.google.com/spreadsheets/d/14wwJn_T3o99kF_oEq8uZ0xYGWGwoTiGmOdv44CbQwt0/edit?gid=434890356#gid=434890356)
<img width="1428" height="819" alt="image" src="https://github.com/user-attachments/assets/aaf346ab-7e0c-4373-b899-f4df031fd0d0" />

## [🪧ERD](https://www.erdcloud.com/d/zo7c3EtFTFLD6g6gD)
<img width="2808" height="1647" alt="Stock101-3" src="https://github.com/user-attachments/assets/c13278dc-4556-4397-8f58-511caae2f100" />


## [🗃️테이블 명세서](https://docs.google.com/spreadsheets/d/1aHppUl-7VBDqVcq6Ckb8BzpCgmxDSZCnURZARkLruMo/edit?usp=sharing)
<img width="1582" height="744" alt="image" src="https://github.com/user-attachments/assets/81813c0d-3465-46ae-b7c4-3ef0fc4eeaf9" />


## [🎯API 명세서](https://ber5f1ykpv.apidog.io/)
<img width="1445" height="1082" alt="image" src="https://github.com/user-attachments/assets/68fbff20-239e-419f-bcd8-bb7c196edfe6" />

### 회고록
---
#### 🦄윤석현
> 웹을 처음 개발해보았는데 그간 BaaS로 쉽게 개발을 했었는데 일일이 API를 개발해야 한다는 사실에 조금 충격받았지만 놀랍도록 빠르게 익숙해져서 간단한 API는 금방 구현을 할 수 있게 되었다. 깃허브를 통한 협업은 상당히 어려웠지만 스태시, 체리픽에 익숙해진 이후 브랜치관리나 커밋 풀 컨플릭트 등을 능숙하게 해결할 수 있게 되어 개인 프로젝트도 로컬로 관리했었는데 이젠 깃허브를 사용해서 관리할 수 있게 되었다. 많이 배우고 성장해서 기쁘다.

#### 🐣손혜원
> 처음 프론트와 백을 구현하는 의미있는 프로젝트였습니다. intelliJ와 VSCode의 git 기능을 활용하면서 IDE와 Git 모두 익숙해질 수 있었던 기회였습니다. 개인 notion에 프로젝트 관리 페이지를 만들어 issue와 솔루션을 기록했고 협업과 자기 피드백에 도움이 되었습니다. 

#### 🐢박진우
> 구현이 참 의미있었다. 프론트 백엔드를 통해 내가 하고싶은걸 얻었다. 백엔드와 프론트에서도 좋은 구조를 고민했는데 아직 더 할게 많이 남았다고 생각한다. 이제는 기능만 개발하는 사람이 아니라 성장한 사람이 되고싶다. 

#### 🦆조원석
> 계획한 것을 다 담지못하여 아쉬움이 크긴하지만 좋은사람들과 즐겁게 작업하게되어 좋기도 하다. 구현하는 과정에서 생각지 못한 문제를 의견을 조율해가며 해결하는 과정도 뜻깊었고 Spring을 꽤 능숙하게 사용할 수 있게된것같아 의미있는 프로젝트였다.
