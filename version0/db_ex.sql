show databases;
create database asp;
use asp;
##기본테이블 -> 
create table base(
	web_id varchar(100),
	content_id varchar(100) not null,
	user_id varchar(100) not null,
	primary key(content_id),
	unique(user_id)
)engine=InnoDB default charset = utf8;
##컨텐츠 테이블 -> 관리를 위해 사용
create table content(
	content_id varchar(100) not null,
	catagory varchar(100) not null,
	primary key(content_id),
	foreign key(content_id) references base(content_id)
)engine=InnoDB default charset = utf8;
## webcms - web에 등록된 컨텐츠만 관리
create table webCms(
	web_id varchar(100) not null,
	content_id varchar(100) not null,
	M_cnt int not null,
	W_cnt int not null,
	cnt int not null,
	primary key(web_id)
)engine=InnoDB default charset = utf8;
##web cms와 base 연결
alter table base add constraint web_id 
foreign key (web_id) references webCms (web_id);
#user 정보 저장 테이블
create table userT(
	table_index int not null,
	user_id varchar(100) not null,
	name varchar(100) not null,
	age int,
	sex varchar(10),
	phonNum varchar(20),
	primary key(table_index),
	unique(user_id),
	foreign key (user_id) references base(user_id)
)engine=InnoDB default charset = utf8;
#content log 테이블 언제부터 언제까지 content를 제공했는지
create table content_log(
	table_index int not null,
	content_id varchar(100) not null,
	web_id varchar(100) not null,
	start_date date not null,
	end_date date,
	total_cnt int,
	primary key (table_index),
	foreign key(content_id) references content(content_id)
)engine=InnoDB default charset = utf8;
#web log 
create table web_log(
	access_index int not null,
	content_id varchar(100) not null,
	accessdate date not null,
	accesstime date not null,
	primary key(access_index),
	foreign key (content_id) references base(content_id),
	foreign key (content_id) references content(content_id)
)engine=InnoDB default charset = utf8;

