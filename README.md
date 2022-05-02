#cloudAppConentService의 db파트 부분 담당자 : 위대환 
CMS-
  1. 나이대별 선호 컨텐츠 : db.sql 하단에 위치
  2. 성별별 선호 컨텐츠 : db.sql 하단에 위치
  3. 누적 선호 컨텐츠 : db.sql 하단에 위치
  4. 나이대별 선호 카테고리 : function.slq의 CMS_category_age_part1함수
  5. 성별별 선호 카테고리 : function.slq의 CMS_category_sex_part1함수
  
DB-sever
  1. 오류 테이블 : db_functionn.js의 insert_error
  2. 유저정보 확인 및 없을경우 유정정보 추가 함수 : function.slq의 checkuser 함수 , db_functionn.js의 user
  3. 컨텐츠 추가 함수  : function.slq의 insertConent함수
  4. 카테고리 추가함수 : function.slq의 insertCategory함수
  5. path 얻기 함수 : db_functionn.js의 getpath
 
 JS파일
 
 test.js: 올바르게 작동하는지 확인하는 js파일
 db_function.js: db와 관련되 js함수를 모아놓은 js파일
 db.js : db와 연결하는 파일
 
 SQL파일
 
 db.sql : table생성 관련된 sql문장
 function.sql : pl sql 형식으로 만든 sql 함수
 
 실행방법
 
 1.function.sql 의 sql 문장 실행
 2.db.sql의 sql 문장 실행
 3.db.js의 js 본인 db 비밀번호 입력
 4.test.js 파일 실행
 
 
