use CloudContent ;
/*******���̺� �Է��ϱ� *********/
################## ī�װ� #################
call insertCategory("cosmetic");
call insertCategory ("fashion");
call insertCategory ("sport");
call insertCategory ("accessory");

################## ������ #################
call insertContent("earing", "accessory");
call insertContent("neckless", "accessory");
call insertContent("foundation", "cosmetic");
call insertContent("perfume", "cosmetic");
call insertContent("bottom", "fashion");
call insertContent("top", "fashion");
call insertContent("leisure", "sport");
call insertContent("outdoor", "sport");


##content �Խ� ����##
#call exitContent("���"); ##����� ������ ������ ������ �Խ�����ð� �Է�


################## ���� #################
insert into user_info (uid, sex, age) values("jhon", "��", 15);
insert into user_info (uid, sex, age) values("ryze", "��", 43);

insert into user_info (uid, sex, age) values("hailee", "��", 39);
insert into user_info (uid, sex, age) values("eddile", "��", 52);

call check_user("diana","��", 24);
call check_user("aaron", "��", 50);