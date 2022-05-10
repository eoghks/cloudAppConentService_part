use CloudContent ;
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