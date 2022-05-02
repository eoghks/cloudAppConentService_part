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
 
 test.js: 올바르게 작동하는지 확인하는 js파일
 db.js : db와 연결하는 파일
