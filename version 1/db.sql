create database CloudCotent;
use CloudCotent ;

create table category(
	category_idx int not null auto_increment,
	category_name varchar(100) not null,
	unique (category_name),
	primary key (category_idx)
)engine=InnoDB default charset='utf8';

##카테고리에 입력해보기 ##
call insertCategory("cosmetic");
call insertCategory ("fashion");

select * from category ;

#### content table ####

drop table content;

create table content(
	content_idx int not null auto_increment,
	content_name varchar(100) not null,
	category_idx int not null,
	path varchar(100) default "~/var/www/html/pdf",
	cnt int default 0,
	start_date date not null,
	end_date date ,
	unique(content_name),
	primary key(content_idx)
)engine=InnoDB default charset='utf8'; 

##content에 입력해보기##
call insertContent("사과", "cosmetic");
call insertContent("바나나", "cosmetic");

select * from content;

##content 게시 종료##
call exitContent("사과");
call exitContent("바나나");


select category_idx, path from content  where content_name="사과" ;
select category_name from category  where category_idx=1;

/***************** *********************/

#### user table ####
#이미 다른 홈페이지에서 회원가입이 되어있는 점을 가만하여 아이디가 중복되는것을 확인하지는 않는다.
#이름은 별로 중요하지 않다.
create table user_info(
	idx int not null auto_increment ,
	uid varchar(100) not null,
	sex varchar(10) not null,
	age int not null,
	primary key(uid),
	unique(idx)
)engine=InnoDB default charset='utf8'; 

select * from user_info;

insert into user_info (uid, sex, age) values("jhon", "남", 15);
insert into user_info (uid, sex, age) values("ryze", "남", 43);

insert into user_info (idx,uid, sex, age) values(1,"hailee", "여", 39);
insert into user_info (idx,uid, sex, age) values(2,"eddile", "남", 52);

call check_user("diana","여", 24);
call check_user("aaron", "남", 50);


#### 오류 저장 테이블 ####

create table error_log(
	idx int not null auto_increment ,
	error_date varchar(100) not null,
	sqlmessage varchar(300) not null,
	pos varchar(100) not null,
	primary key(idx)
) engine=InnoDB default charset='utf8'; 

select *from error_log;

##오류 테이블에 집어넣는건 visual code에서 해야하는 일

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


/***************** CMS 테이블 *********************/


create table CMS_age(
	content varchar(100) not null primary key,
	10대 int default  0,
	20대 int default  0,
	30대 int default  0,
	40대 int default  0,
	50대이상 int default  0
)engine=InnoDB default charset='utf8'; 


select * from CMS_age;


create table CMS_sex(
	content varchar(100) not null primary key,
	남 int default 0,
	여 int default 0
)engine=InnoDB default charset='utf8'; 


select * from CMS_sex;

update CMS_sex set 남=1 where content="바나나";
update CMS_age set 20대=1 where content="바나나";
update content set cnt=1 where content_name="바나나";
###내장 함수 생성 불가 ###
/*****미리 sql 작성 후 수정 하는 방법 ****/ 
#성별 선호 컨텐츠
select 남/**/,content from CMS_sex order by 남 desc;
#나이대별 선호 컨텐츠
select 20대/**/,content from CMS_age order by 20대 desc;
#누적 선호 컨텐츠
select cnt/**/,content_name from content order by cnt desc;

ALTER TABLE cloudcotent.content ADD CONSTRAINT content_FK FOREIGN KEY (category_idx) REFERENCES cloudcotent.category(category_idx);
ALTER TABLE cloudcotent.content ADD CONSTRAINT content_FK_1 FOREIGN KEY (content_name) REFERENCES cloudcotent.cms_sex(content);
ALTER TABLE cloudcotent.content ADD CONSTRAINT content_FK_2 FOREIGN KEY (content_name) REFERENCES cloudcotent.cms_age(content);

