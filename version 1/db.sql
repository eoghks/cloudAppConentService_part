create database CloudCotent;
use CloudCotent ;

create table category(
	category_idx int not null auto_increment,
	category_name varchar(100) not null,
	unique (category_name),
	primary key (category_idx)
)engine=InnoDB default charset='utf8';

##ī�װ��� �Է��غ��� ##
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

##content�� �Է��غ���##
call insertContent("���", "cosmetic");
call insertContent("�ٳ���", "cosmetic");

select * from content;

##content �Խ� ����##
call exitContent("���");
call exitContent("�ٳ���");


select category_idx, path from content  where content_name="���" ;
select category_name from category  where category_idx=1;

/***************** *********************/

#### user table ####
#�̹� �ٸ� Ȩ���������� ȸ�������� �Ǿ��ִ� ���� �����Ͽ� ���̵� �ߺ��Ǵ°��� Ȯ�������� �ʴ´�.
#�̸��� ���� �߿����� �ʴ�.
create table user_info(
	idx int not null auto_increment ,
	uid varchar(100) not null,
	sex varchar(10) not null,
	age int not null,
	primary key(uid),
	unique(idx)
)engine=InnoDB default charset='utf8'; 

select * from user_info;

insert into user_info (uid, sex, age) values("jhon", "��", 15);
insert into user_info (uid, sex, age) values("ryze", "��", 43);

insert into user_info (idx,uid, sex, age) values(1,"hailee", "��", 39);
insert into user_info (idx,uid, sex, age) values(2,"eddile", "��", 52);

call check_user("diana","��", 24);
call check_user("aaron", "��", 50);


#### ���� ���� ���̺� ####

create table error_log(
	idx int not null auto_increment ,
	error_date varchar(100) not null,
	sqlmessage varchar(300) not null,
	pos varchar(100) not null,
	primary key(idx)
) engine=InnoDB default charset='utf8'; 

select *from error_log;

##���� ���̺� ����ִ°� visual code���� �ؾ��ϴ� ��

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


/***************** CMS ���̺� *********************/


create table CMS_age(
	content varchar(100) not null primary key,
	10�� int default  0,
	20�� int default  0,
	30�� int default  0,
	40�� int default  0,
	50���̻� int default  0
)engine=InnoDB default charset='utf8'; 


select * from CMS_age;


create table CMS_sex(
	content varchar(100) not null primary key,
	�� int default 0,
	�� int default 0
)engine=InnoDB default charset='utf8'; 


select * from CMS_sex;

update CMS_sex set ��=1 where content="�ٳ���";
update CMS_age set 20��=1 where content="�ٳ���";
update content set cnt=1 where content_name="�ٳ���";
###���� �Լ� ���� �Ұ� ###
/*****�̸� sql �ۼ� �� ���� �ϴ� ��� ****/ 
#���� ��ȣ ������
select ��/**/,content from CMS_sex order by �� desc;
#���̴뺰 ��ȣ ������
select 20��/**/,content from CMS_age order by 20�� desc;
#���� ��ȣ ������
select cnt/**/,content_name from content order by cnt desc;

ALTER TABLE cloudcotent.content ADD CONSTRAINT content_FK FOREIGN KEY (category_idx) REFERENCES cloudcotent.category(category_idx);
ALTER TABLE cloudcotent.content ADD CONSTRAINT content_FK_1 FOREIGN KEY (content_name) REFERENCES cloudcotent.cms_sex(content);
ALTER TABLE cloudcotent.content ADD CONSTRAINT content_FK_2 FOREIGN KEY (content_name) REFERENCES cloudcotent.cms_age(content);

