use CloudContent ;
/*******테이블 select *********/
select * from category ;
select * from content;
#select category_idx, path from content  where content_name="사과" ; //프로시저 개발시 확인용 코드
#select category_name from category  where category_idx=1; //프로시저 개발시 확인용 코드
select * from user_info;
select *from error_log;
select * from CMS_age;
select * from CMS_sex;
select * from age_category;
select * from sex_category;


/***********CMS*****************/
call CMS_category_age_part1();
call CMS_category_sex_part1();
###내장 함수 생성 불가 ###
/*****미리 sql 작성 후 수정 하는 방법 ****/ 

#성별 선호 컨텐츠 ##남을 여로 변경
select 남/**/,content from CMS_sex order by 남 desc;
#나이대별 선호 컨텐츠  ##20대를 원하는 나이대로 변경
select 20대/**/,content from CMS_age order by 20대 desc;
#누적 선호 컨텐츠
select cnt/**/,content_name from content order by cnt desc;
#성별 선호 카테고리 ##남성을 여성으로 변경
select 남성,category_name from sex_category order by 남성 desc;
#나이대별 선호 카테고리 ##20대를 원하는 나이대로 변경
select 20대/**/,category_name from age_category order by 20대 desc;