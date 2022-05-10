create database CloudContent ;
use CloudContent ;
show tables;

/****** table drop */
drop table category;
drop table content;
drop table CMS_age;
drop table CMS_sex;
drop table error_log ;
drop table user_info ;
/*******테이블 *********/
################## 카테고리 #################
create table category(
	category_idx int not null auto_increment,
	category_name varchar(100) not null,
	primary key (category_idx),
	unique (category_name)
)engine=InnoDB default charset='utf8';

################## 컨텐츠 #################
create table content(
	content_idx int not null auto_increment,
	content_name varchar(100) not null,
	category_idx int not null,
	cnt int default 0,
	start_date date not null,
	end_date date ,
	unique(content_name),
	primary key(content_idx)
)engine=InnoDB default charset='utf8'; 

################## 유저테이블 #################
#이미 다른 홈페이지에서 회원가입이 되어있는 점을 가만하여 아이디가 중복되는것을 확인하지는 않는다.
#이름은 별로 중요하지 않다.
create table user_info(
	idx int not null auto_increment ,
	uid varchar(100) not null,
	sex varchar(10) not null,
	age int not null,
	primary key(idx),
	unique(uid)
)engine=InnoDB default charset='utf8'; 

################## CMS #################
create table CMS_age(
	content varchar(100) not null primary key,
	10대 int default  0,
	20대 int default  0,
	30대 int default  0,
	40대 int default  0,
	50대이상 int default  0
)engine=InnoDB default charset='utf8'; 

create table CMS_sex(
	content varchar(100) not null primary key,
	남 int default 0,
	여 int default 0
)engine=InnoDB default charset='utf8'; 

################## 오류 #################

create table error_log(
	idx int not null auto_increment ,
	error_date varchar(100) not null,
	sqlmessage varchar(300) not null,
	pos varchar(100) not null,
	primary key(idx)
) engine=InnoDB default charset='utf8'; 

##오류 테이블에 집어넣는건 visual code에서 해야하는 일





/*******테이블 입력하기 *********/
################## 카테고리 #################
call insertCategory("cosmetic");
call insertCategory ("fashion");
call insertCategory ("sport");
call insertCategory ("accessory");

################## 컨텐츠 #################
call insertContent("earing", "accessory");
call insertContent("neckless", "accessory");
call insertContent("foundation", "cosmetic");
call insertContent("perfume", "cosmetic");
call insertContent("bottom", "fashion");
call insertContent("top", "fashion");
call insertContent("leisure", "sport");
call insertContent("outdoor", "sport");


##content 게시 종료##
#call exitContent("사과"); ##사과에 컨텐츠 네임을 적으면 게시종료시간 입력


################## 유저 #################
insert into user_info (uid, sex, age) values("jhon", "남", 15);
insert into user_info (uid, sex, age) values("ryze", "남", 43);

insert into user_info (uid, sex, age) values("hailee", "여", 39);
insert into user_info (uid, sex, age) values("eddile", "남", 52);

call check_user("diana","여", 24);
call check_user("aaron", "남", 50);

################## CMS용 테스트 #################
/*
update CMS_sex set 남=1 where content="바나나";
update CMS_age set 20대=1 where content="바나나";
update content set cnt=1 where content_name="바나나";
*/




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




/***************** *********************/

/*
##test##
create table date_test(
	idx int not null auto_increment,
	test varchar(100) not null,
	primary key(idx)
)engine=InnoDB default charset='utf8'; 
set @a=NOW();
select @a;

insert into date_test (test) values (@a);

select *from date_test ;

drop table date_test;

*/



/*****추가된곳*****/
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


