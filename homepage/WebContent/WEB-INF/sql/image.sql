drop table image;

create table image(
ino 	number	           not null,
title 	varchar(100)       not null,
fname 	varchar(100)       not null,
content varchar(300)       not null,
passwd 	varchar(100)       not null,
mname 	varchar(100)       not null,
wdate 	DATE 	           not null,
primary key(ino)
)

select * from image;


--pwCheck
select count(*) as cnt
from image
where ino=1 and passwd='123';

--total
select count(*) as cnt
from image
WHERE "+col+" like '%'||?||'%';

insert into image(ino, mname, title, content, passwd, wdate, fname)
values((select nvl(max(ino),0) + 1 as ino from image),
'홍길동','제목','내용','비밀번호',sysdate,'member.jpg');

insert into image(ino, mname, title, content, passwd, wdate, fname)
values((select nvl(max(ino),0) + 1 as ino from image),
'김길동','안녕','바이','123',sysdate,'배고프다');