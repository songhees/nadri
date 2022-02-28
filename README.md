# nadri Project

팀 프로젝트로 진행한 **여행 예매 사이트**입니다.   

기간 : **2022/01/09 ~ 2022/02/15** (약 한달)  
인원 : 4명

</br>

#### 맡은 역할(My Role)
+ 기차 예약 메뉴
+ 통계
+ 관리자 로그인/로그아웃
</br>

#### stack

|front|back   |
|-----|-------|
|Html 5 |java   |
|css 3 |SQL Developer |
|jsp  |mybatis|
|javascript|spring Boot|
|JQuery|oracle|
|BootStrap|

</br>
  
  

## 화면설명
#### gif를 클릭하시면 화면이 커집니다!

</br>
  
### 검색창
![검색](https://user-images.githubusercontent.com/92537000/155129274-09f64fb6-04b9-4a9b-bdf5-09722c321943.gif)

+ 기차역 입력
    1. 모달창으로 기차 역 선택
    2. 직접 입력
    3. 열차 아이콘 클릭 시 출발지 도착지 바뀜
+ 편도/왕복중 하나를 선택
+ 인원은 최대 9명 이하 가능
    + **[에러]** 10명 이상선택시 경고창이 뜹니다.
+ 날짜/시간 선택
    + 현재 시간보다 늦은 시간은 선택할 수 없습니다.
    + **[에러]** 가는 열차가 오는 열차보다 더 빠른 날짜를 선택하면 경고창이 뜹니다.
+ 승객수를 선택하지 않은 경우 자동으로 어른 1명이 선택됩니다.
  
</br>
  
### 예매하기
![검색후](https://user-images.githubusercontent.com/92537000/155130084-313de715-b02e-4f90-8a1b-44677c45e5dd.gif)

+ 인기 노선 목록의 Book now를 클릭하면 어른 1명과 오늘날짜/시간을 기준으로 편도로 검색됩니다.
    + 기차 목록은 **공공데이터포털 api**를 사용하여 데이터를 가져왔습니다. 
+ 기차 예매 목록에서도 검색이 가능
+ 운임 행의 보기 버튼
    + 인원 수에 해당하는 운임비를 확인할 수 있습니다.
+ 예약 버튼
    + 매진된 호차는 회색으로 표시, 선택할 수 없습니다.
    + 열차 번호마다 객실 수 좌석 수가 다르게 표시됩니다.
    + **[에러]** 현재 시간에서 20분 이내로 출발하는 열차는 예매할 수 없습니다.
  
</br>
  
![좌석예약](https://user-images.githubusercontent.com/92537000/155130838-f92b7603-93a0-486d-954a-8588a66b0d41.gif)

+ 좌석 선택버튼
    + **[에러]** 인원수 보다 적게 선택 후 예약버튼을 클릭시 경고창이 뜹니다.
    + **[에러]** 인원수 보다 많이 선택하면 경고창이 뜹니다.
    + 모달창을 나가거나 다른 호차를 클릭시 좌석선택이 초기화 됩니다.
+ 왕복의 경우
    + 왕복일 경우 이미 선택한 좌석을 바꿀 수 없습니다.
    + 초기화 버튼 혹은 새로고침을 누르면 좌석 선택정보가 초기화 됩니다.
    + 같은 날짜의 가는 열차의 도착 시간보다 오는 열차의 출발시간이 더 빠른 시간이어야 됩니다. 
+ 선택좌석예약 버튼
    + 모든 노선의 좌석을 선택한 경우 예약 페이지로 이동됩니다.

</br>
  
### 예약수정/삭제하기

![예약수정삭제](https://user-images.githubusercontent.com/92537000/155131463-ee32b24d-dd13-413b-b4bc-450cffe690b6.gif)

+ 예약취소
    + 예약 취소 버튼 클릭
    + 예약 후 10분 이내로 결제하지 않으면 예약이 **자동 취소**됩니다.
+ 예약변경에서 하나의 예약만 변경할 수 있습니다.
    + 승객유형을 변경할 수 있습니다.
    + 어른/어린이/선택안함이 있습니다.
    + 선택안함일 경우 해당 티켓은 예약 취소 됩니다.
  
</br>
  
### 결제하기

![결제](https://user-images.githubusercontent.com/92537000/155131781-cda70252-1225-4645-899a-c96aaa973e6b.gif)

+ 한번에 2개 이하의 개수를 결제할 수 있습니다.
+ 결제종류는 카카오페이가 있습니다.
    + **[에러]** 결제 종류를 선택하지 않으면 경고창이 뜹니다.
+ 승차권 발권을 위해 승차자명을 적어야 합니다.
    + **[에러]** 승차자명을 적지 않으면 경고창이 뜹니다.
+ 결제하기 버튼
    + 카카오 결제 페이지로 이동됩니다.
  
</br>
  
![결제완료](https://user-images.githubusercontent.com/92537000/155132085-5067a89f-5334-449e-9861-cb9cfabf33fc.gif)

+ 결제 결과를 볼 수 있습니다.
  
</br>
  
### 발권하기

![발권](https://user-images.githubusercontent.com/92537000/155132274-e421209b-4ecf-4e17-b0a4-863368dca0f9.gif)

+ 발권 버튼을 클릭하면 결제시 입력했던 승차자명으로 승차권 목록이 나옵니다.
+ 프린트를 통해 해당 화면의 승차권을 저장할 수 있습니다.
  
</br>
  
### 이용내역

![이용내역](https://user-images.githubusercontent.com/92537000/155289486-0e1a28fd-d148-4a48-b1d7-9d1fe72a77e6.gif)

+ 발권/취소에서는 승차일자가 지난 예약은 확인하실 수 없습니다.
+ 발권/취소에서 열차 번호를 클릭하면 티켓 목록을 확일할 수 있습니다.
+ 이용내역에서 승차일자 기준으로 환불/계산 내역을 확인할 수 있습니다.
  
</br>
  
### 환불하기

![환불](https://user-images.githubusercontent.com/92537000/155289495-c46615c9-4c63-4617-a872-4edfdd3a676d.gif)
  
+ 환불은 하나의 예약만 가능합니다.
+ 티켓을 지정해서 환불할 수 있습니다.
+ 환불 수수료가 계산됩니다.

</br>
  
### 관리자 메뉴

![관리자](https://user-images.githubusercontent.com/92537000/155132488-13842a56-a836-4d3e-8388-ec3bbc3403c5.gif)

+ 관리자 메뉴는 따로 footer메뉴에서 들어갈 수 있습니다.
+ 관리자 로그인은 개발자를 통해 관리자가 아이디와 비밀번호를 받아야 합니다.
+ home
    + 일일 사용자 현황/매출
    + 예약/결제/취소 현황
+ 사용자관리 
    + 회원 검색
    + 연령별/성별 비율
+ 통계
    + 카테고리별 인기 상품
    + 연령별/성별 누적 금액

</br>
  
#### 감사합니다
