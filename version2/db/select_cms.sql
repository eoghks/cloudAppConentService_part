use CloudContent ;
/*******���̺� select *********/
select * from category ;
select * from content;
#select category_idx, path from content  where content_name="���" ; //���ν��� ���߽� Ȯ�ο� �ڵ�
#select category_name from category  where category_idx=1; //���ν��� ���߽� Ȯ�ο� �ڵ�
select * from user_info;
select *from error_log;
select * from CMS_age;
select * from CMS_sex;
select * from age_category;
select * from sex_category;


/***********CMS*****************/
call CMS_category_age_part1();
call CMS_category_sex_part1();
###���� �Լ� ���� �Ұ� ###
/*****�̸� sql �ۼ� �� ���� �ϴ� ��� ****/ 

#���� ��ȣ ������ ##���� ���� ����
select ��/**/,content from CMS_sex order by �� desc;
#���̴뺰 ��ȣ ������  ##20�븦 ���ϴ� ���̴�� ����
select 20��/**/,content from CMS_age order by 20�� desc;
#���� ��ȣ ������
select cnt/**/,content_name from content order by cnt desc;
#���� ��ȣ ī�װ� ##������ �������� ����
select ����,category_name from sex_category order by ���� desc;
#���̴뺰 ��ȣ ī�װ� ##20�븦 ���ϴ� ���̴�� ����
select 20��/**/,category_name from age_category order by 20�� desc;