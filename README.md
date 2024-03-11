# 개발자 협력 웹사이트 CoCo (Collaboration Code)
![image](https://github.com/rddckdeo/FinalProject/assets/150643230/e8e30ab1-3acf-4c62-b6ef-25ada0d50d8c)

# 홈페이지 사진

<div align="center">
    <img src="https://github.com/rddckdeo/FinalProject/assets/150643230/12f67307-5155-4891-8116-d698e04aa635" width="600">
    <img src="https://github.com/rddckdeo/FinalProject/assets/150643230/b3822f22-94dc-4685-bf1c-e37cd6a16539" width="300" height="330">
    <img src="https://github.com/rddckdeo/FinalProject/assets/150643230/323dd052-e06f-44a4-a4cd-380ac1586903" width="300" height="330">
    <img src="https://github.com/rddckdeo/FinalProject/assets/150643230/9c802c65-0ac7-4595-a866-e0f4e35958be" width="600">
    <img src="https://github.com/rddckdeo/FinalProject/assets/150643230/4580c359-f5cc-4cd1-aa60-30e123f24db5" width="600">
    <img src="https://github.com/rddckdeo/FinalProject/assets/150643230/8573412f-b6ab-40f3-bda0-ac30a9a861b6" width="600">
    <img src="https://github.com/rddckdeo/FinalProject/assets/150643230/f1f31391-24d1-4afd-be15-6e63112fd531" width="600">
</div>

## 프로젝트 소개
**프로젝트 팀명 | CoCo ( Collaboration Code )
<br/>
프로젝트 기간 | 2024.01.18 ~ 2024.02.26
<br/>
프로젝트 인원 | 3명 (백엔드 3명 [Full])
<br/>
홈페이지 한줄 설명 | <br/>
CoCo 프로젝트는 자신의 아이디어를 기획 및 구상하여 프로젝트를 생성하고 팀원을 모집한 후에 프로젝트를 진행하는 협력을 강조하는 웹 사이트입니다.**
![image](https://github.com/rddckdeo/FinalProject/assets/150643230/c11e5807-ba07-40af-ace1-a718ab0f3a62)
## 구현된 기능 소개
![image](https://github.com/rddckdeo/FinalProject/assets/150643230/c2d82013-213a-4b2f-a480-ac4d56035c96)
- 주요 기능 |
    - 로그인, 회원가입,  비밀번호 암호화, 정보 중복 체크 (아이디, 닉네임), 비밀번호 재확인, 
    희망직무 및 기술 스택 입력, Sweet alert
    - 협업 홈페이지 |
        - 프로젝트 생성, 사용자 초대, 일정 등록(월간, 일간), 초대 알림
        - 캔버스 API 사용, AWS를 이용한 채팅, 그림판 API, 팀공지, 프로젝트 기능 분담
        - 프로젝트 전체 달성도 및 부분 달성도(그래프)
    - 게시판 |
        - 정보게시판 (프로그래밍 언어, 데이터베이스, 모바일 개발 등 총 9개의 카테고리 )
        - 자유게시판 (일상, 정보공유, 취미, 추천&리뷰 총 4개의 카테고리)
        - 인원 모집중인 추천 프로젝트 List 출력 및 게시판 검색 기능
    - 홈페이지 운영 |
        - Mypage | 프로필, 내정보 수정, 내가 작성한 글( 댓글, 게시판, 프로젝트 등 ),
        알림 모음, 문의 사항 기능 (작성, 수정, 삭제), 개인정보방침 및 이용약관 (Modal)
        - Admin | Summary ( 전체 방문자 수, 전체 게시글 등 ), 방문자 통계 ( 그래프 ),
        카테고리별 페이지 구현 ( 방문자, 사용자 관리, 프로젝트, 문의사항, 게시판, 신고 )
## ERD Cloud
![image](https://github.com/rddckdeo/FinalProject/assets/150643230/6d3e2ec2-3435-4f6b-ba7e-edfc7a3cfb04)
내가 사용한 Table |
- Member Table
- 문의사항 Table
- 게시판 알림 Table

## 기술 스택
![image](https://github.com/rddckdeo/FinalProject/assets/150643230/3f89f54f-a5af-4e0a-b95b-a974dc9600fb)
## 유스케이스
![image](https://github.com/rddckdeo/FinalProject/assets/150643230/380bea89-1b0c-4567-b666-d2df2a66ddd9)
![image](https://github.com/rddckdeo/FinalProject/assets/150643230/b85e15cf-e61a-41b3-b74d-6b26b5ae221c)
![image](https://github.com/rddckdeo/FinalProject/assets/150643230/18e985ab-cdc2-4f80-8f59-d353b4569272)
![image](https://github.com/rddckdeo/FinalProject/assets/150643230/feea80be-d074-4de1-8003-63a8cb8b394b)
![image](https://github.com/rddckdeo/FinalProject/assets/150643230/5328cc2d-8a68-4186-be86-0bc1ae47092f)

# 나의 기능 
- ## Main Page
### Main Page는 협업 홈페이지와 게시판 홈페이지 중 선택하여 들어갈 수 있으며 로그인, 마이페이지, Admin 페이지로 이동할 수 있는 포털사이트 개념으로 만들었습니다.
### 1.페이지 별 이동
5개의 홈페이지로 이동할 수 있으며 각각 로그인을 해야만 이동할 수 있는 페이지, 비회원도 이용 가능한 홈페이지, admin 권한을 부여받은 인원 접속 가능한 홈페이지가 있습니다.
![image](https://github.com/rddckdeo/FinalProject/assets/150643230/81e10759-7656-4fcd-947e-b5b1107fcc54)
### 2. JSTL을 이용한 조건 태그 표시
1. 로그인을 하지 않을 경우 my page, admin page, 로그아웃 등 기능이 비활성화
2. 로그인을 할 경우 사용자의 이름을 표시
3. admin이 접속했을 경우 admin Page 접속이 보이게 설정
![image](https://github.com/rddckdeo/FinalProject/assets/150643230/c894ea3e-62d2-4b36-81bc-218a54b1f9fe)

- ## 로그인, 회원가입
### 로그인 기능
### 1. 로그인, 로그아웃 기능 구현 <br/>
<p align="center">
    <img src="https://github.com/rddckdeo/FinalProject/assets/150643230/fb2a6e62-7c9c-497a-b2e5-1a270831814c" width="400" height="500">
</p> <br/>


### 2. sweet alert를 사용한 Login 여부 확인
<div align="center">
<img src="https://github.com/rddckdeo/FinalProject/assets/150643230/33b953dc-c106-410a-a779-dc943e5fa19e" width ="300" height="200">
<img src="https://github.com/rddckdeo/FinalProject/assets/150643230/c68432e1-ce5f-4f1e-817f-8a49bc6f82a6" width ="300" height="200">
</div>
일반적인 alert를 사용하여 로그인 여부를 알려줄 수 있으나 sweet alert를 사용하여 홈페이지를 좀 더 부드럽게 만들어 사용자 경험을 향상시키고자 해당 기능을 사용하였습니다.


### 회원 가입
### 1. 아이디, 닉네임 중복체크 기능
![image](https://github.com/rddckdeo/FinalProject/assets/150643230/8f673394-dd73-4358-800d-a862627b5265) <br/>
회원가입을 하기 전 ID 또는 닉네임이 중복되면 안되기에 버튼을 click하여 데이터베이스에 일치하는 값이 있는지 확인을 합니다.
- 일차하는 값이 있을 경우 "이미 (아이디가, 닉네임이) 있습니다." 표시
- 일치하는 값이 없을 경우 "사용 가능한 (아이디, 닉네임)입니다." 표시

### 2. 비밀번호 암호화
- 스프링 시큐리티에서 제공하는 bcryptpasswordencoder를 사용하여 비밀번호 암호화 사용
<img src="https://github.com/rddckdeo/FinalProject/assets/150643230/77be0d2e-9f45-4742-b8de-6859fe099819" width ="500" height="150"> <br/>
- 로그인을 할 때도 bcryptpasswordencoder에 포함된 match 기능을 사용하여 입력한 비밀번호와 암호화된 비밀번호가 일치한지 여부를 확인

### 3. 비밀번호 일치 여부 확인
![image](https://github.com/rddckdeo/FinalProject/assets/150643230/57f34ccf-59eb-4466-bca7-7e1272b378cc) <br/>
입력한 비밀번호와 비밀번호 재확인에 입력된 값을 비교하여 해당 값이 일치한지 표시
- 일치하는 경우 "비밀번호가 일치합니다" 표시
- 일치하지 않을 경우 "비밀번호가 일치하지 않습니다." 표시

### 4. 희망직무, 기술스택 입력  <br/>
<img src="https://github.com/rddckdeo/FinalProject/assets/150643230/4486f44b-e108-4ce0-b0ae-d47bd5990a82"> <br/>
개발자들이 모여 프로젝트를 만드는 홈페이지이기에 자신이 원하는 희망직무, 기술스택을 입력할 수 있도록 설정하였습니다.
희망직무 및 기술스택을 입력하는 것이 아닌 선택하게 만들 수 있지만 카테고리가 매우 많기에 회원가입하는 본인이 직접 입력할 수 있도록 하였습니다.
- 입력을 하고 Enter를 누르면 입력한 글자가 저장
- 잘못 입력한 것은 도중 삭제 가능
- 입력을 여러개 할 경우 " , "가 붙어서 DB에 값을 전달 ( 예시 : Spring, java, HTML, CSS )

### 5. 약관 동의 <br/>
![Animation3](https://github.com/rddckdeo/FinalProject/assets/150643230/03d59ba9-f896-44d0-88c2-9153d827c36c) <br/>
회원가입을 할 경우 필수인 약관 동의는 Modal을 이용하였습니다.
- 동의를 선택하지 않을 경우 약관 동의 체크박스가 체크되지 않음
- 동의를 선택할 경우 약관 동의 체크박스가 체크

### 6. 조건 미충족 시 제출 불가
- 아이디 중복체크, 닉네임 중복체크, 비밀번호 일치여부, 약관동의 중 하나라도 조건을 만족하지 못하면 회원가입 버튼이 Click되지 않게 설정하였습니다. 

![Animation4](https://github.com/rddckdeo/FinalProject/assets/150643230/caf1d24c-07a8-453d-a33e-325290c7c40b) <br/>

- ## Admin Page
### Admin이 홈페이지를 관리하기 위해 필요한 기능들과 통계를 보여주는 홈페이지 입니다.
### 1. 기능별 페이지 구현
![Animation5](https://github.com/rddckdeo/FinalProject/assets/150643230/5400df3e-9bc9-48c8-b147-885ff31bbfa4)
- Admin Home : 홈페이지의 전체 방문자,게시글,문의 등 요약을 보여주며 금일 방문자 및 방문자의 대한 그래프를 표시
- 방문자 현황 : 방문자 통계를 막대그래프로 표현 및 전체 방문자 List 표현
- 사용자 관리 : 신규 가입자 List, 검색, 전체 멤버 List, 탈퇴인원 List, 멤버 삭제 및 복구 기능
- 프로젝트 관리 : 프로젝트 별 요약, 프로젝트 별 List, Project 삭제
- 문의사항 : 완료, 미완료, 전체 별 List, Modal을 이용한 Detail Page 구현, 문의 답변 및 삭제 기능 추가
- 게시판 현황 : 게시판 별 List 출력, 삭제 기능
- 신고 List : 금일, 미처리 신고, 처리 신고, 전체 별 List 출력, Modal을 이용한 Detail 페이지 구현, Blind 처리 및 철회 기능 추가

### 2. Summary ( 요약 ) <br/>
![image](https://github.com/rddckdeo/FinalProject/assets/150643230/53b39eda-133f-4e36-ad0b-d74f241f87dc)
Admin이 관리하는 페이지이기에 금일 신규 가입, 금일 신규 프로젝트 또는 신고의 수 등 각각의 통계가 필요하다 생각하여 각 페이지마다 Summary를 상단에 위치시켜 admin이 한 눈에 볼 수 있게 설정하였습니다.
- admin Page의 main page에는 각 카테고리 별 전체 수를 표시
- 사용자, 프로젝트, 신고 등 각 카테고리에 필요한 통계 수를 작성

### 3. 게시판 List 불러오기 <br/>
![image](https://github.com/rddckdeo/FinalProject/assets/150643230/22a38141-98f8-4068-bd9a-d6c4953167f6)<br/>
각 페이지마다 List가 필요하지만 페이지마다 필요한 List의 내용과 수, 조건 등이 다르기에 List를 3가지 방법으로 나눠 각각 적재적소하게 List를 불러오게 하였습니다.<br/>
![Animation6](https://github.com/rddckdeo/FinalProject/assets/150643230/7a2fcffc-c69a-47aa-acd0-c3eeda16e0d7)<br/>

### 4. 게시글 기능 (  삭제, 복구 )
Admin이 관리를 하는 요소 중 중요한 것은 컨텐츠를 삭제하거나 사용자를 복구 시키는 것이라 생각되어 아래 기능을 추가하였습니다.
- 사용자 삭제 및 복구 기능
- 프로젝트 삭제 기능
- 문의사항 삭제 기능
- 게시판 및 댓글 삭제 기능

### 5. 신고 내역 처리 ( Blind, 철회 )
![image](https://github.com/rddckdeo/FinalProject/assets/150643230/49c0e66d-0e43-4008-9ab1-2b4820b2caa0)<br/>
블라인드 처리의 경우 아래의 순서로 진행된다.
- 게시글 또는 댓글이 부적절하여 '신고'를 한다.
- 신고된 내용은 Admin에게 전달되어 게시글을 검토한다.
- 검토한 게시글이 부적절 할 경우 Blind처리, 부적절하지 않을 경우 철회 처리를 한다.
- Blind 처리된 게시글 또는 댓글은 Blind처리가 되어 다른 사용자에게 보이지 않는다.


- ## 알림 기능
### 내가 작성한 게시글에 답글이 달리거나 Admin에게 문의한 답변이 도착하거나 나의 게시글이 Blind처리가 되었을 경우 알림이 표시됩니다.
### 1. 마우스를 올릴 경우 발생한 이벤트를 확인할 수 있습니다. <br/>
아래 3가지의 이벤트가 발생 시 알림 List에 표시가 됩니다.
- 내가 작성한 게시글에 댓글이 달렸을 경우
- 내가 문의한 내용이 답변이 도착하였을 경우
- 내가 작성한 게시글이 Blind 처리가 되었을 경우
<img src="https://github.com/rddckdeo/FinalProject/assets/150643230/57a6e292-09b9-4beb-ae6f-11b6a256b0fe" width ="300" height="400">

### 2. 확인하지 않은 알림의 구분
- 확인되지 않은 신규 알림의 경우 알림 옆에 초록색 동그라미가 표시되게 설정을 해두었습니다.
<img src="https://github.com/rddckdeo/FinalProject/assets/150643230/0a6cdffa-005b-4d83-95ad-7496dca39c51" width ="600" height="200">

### 3. 알림 전체 List
알림으로 이동을 누르면 현재까지의 모든 알림을 열람할 수 있는 my page로 이동하여 현재까지의 알림을 모두 확인할 수 있습니다.
![image](https://github.com/rddckdeo/FinalProject/assets/150643230/418b608b-ad96-4880-a84f-9b4454e2cde6)

## 프로젝트 후기
- 마지막 final 프로젝트는 기존 세미 프로젝트보다 비중있고 더욱 큰 프로젝트를 하고싶다는 욕심이 커서 처음에 팀원들과 주제를 정할 떄 바로 정하지 못하고 헤매었으나 그때 나왔던 주제를 합쳐서 새로운 개념의 홈페이지를 만들자는 의견으로 결정되어 CoCo 프로젝트를 만들게 되었습니다. 예전 프로젝트를 진행할 때 작업을 하다 끊기거나 다음날이 되었을 때 어디까지 작업했는지 찾고 내가 어떤 부분을 설정했는지 기억이 안나서 헤매는 시간이 많았는데 이번 final 프로젝트는 그러한 오류사항을 만들고 싶지 않아 개별적으로 체크리스트를 만들어 필요한 작업이 어떤 것인지, 어떤 부분을 작업했는지 등을 기록해두니 작업에 대한 이해와 불필요한 시간 소요가 없어졌습니다.
<p align="center">
  <img src="https://github.com/rddckdeo/FinalProject/assets/150643230/c1895932-7998-4a4b-8ed0-60744892b11b" width="500" height="350">
</p>
또한 프로젝트에 오류가 발생해서 해결하거나 궁금했던 것들은 시간이 지나면 잊어버리기에 똑같은 오류가 발생했거나 궁금했던 것을 찾아보기 어렵기에 개인 블로그에 기록을 해두었습니다.
<p align="center">
  <img src="https://github.com/rddckdeo/FinalProject/assets/150643230/05c47f8c-b570-40ee-9d8c-961d43698986" width="500" height="260">
</p>
이러한 기록을 통해 기존에 있었던 오류를 해결하고 새로운 지식을 터득해가는 재미를 느꼈습니다. <br/>

- 처음 프로젝트를 토의할 떄 API 사용에 비중을 두어 홈페이지를 만들기로 하였지만 API 사용에 어려움을 느끼며 기존에 짜두었던 Code와 API를 연동시키는 것에 큰 어려움을 겪고 API를 사용하기 위한 지식이 많이 부족하여 기존에 사용하던 API를 모두 지우게 되었습니다. ( 사용 API : recaptcha V2, kakao Login API )
프로젝트가 끝난 후에도 API를 사용하지 못한 것에 대하여 큰 후회가 되지만 지금이라도 다시 공부를 하여 다음 프로젝트에는 반드시 기입을 하겠다는 각오가 생겼습니다.
