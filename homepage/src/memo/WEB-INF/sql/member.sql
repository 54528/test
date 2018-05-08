DROP TABLE member PURGE;

CREATE TABLE member (
id       VARCHAR(10) NOT NULL,              --아이디, 중복안됨, 레코드를 구분하는 컬럼
passwd   VARCHAR(20) NOT NULL,              --패스워드, 영숫자 조합
mname    VARCHAR(20) NOT NULL,              --성명, 한글 10자 저장 가능
tel      VARCHAR(14)     NULL,              --전화번호
email    VARCHAR(50) NOT NULL UNIQUE,       --전자우편 주소, 중복 안됨
zipcode  VARCHAR(7)      NULL,              --우편번호, 101-101
address1 VARCHAR(150)    NULL,              --주소1
address2 VARCHAR(50)     NULL,              --주소2
job      VARCHAR(20) NOT NULL,              --직업
mdate    DATE        NOT NULL,              --가입일
fname    VARCHAR(50) DEFAULT 'member.jpg',  --회원사진
grade    CHAR(1)     DEFAULT 'H',           --일반회원:H, 정지:Y, 손님:Z
PRIMARY KEY(id)                             --한번 등록된 id는 중복 안됨
);

INSERT INTO member(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, grade) 
VALUES('user1', '1234', '개발자1', '123-1234', 'email1@mail.com',  
'123-123','인천시', '남동구' ,'A01', sysdate, 'myface.jpg', 'H'); 
 
INSERT INTO member(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, grade) 
VALUES('user2', '1234', '개발자2', '123-1234', 'email2@mail.com',  
'123-123','광명시','남동구' ,'A01', sysdate, 'man.jpg', 'H'); 
 
INSERT INTO member(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, grade) 
VALUES('1234', '123', '김길동', '123', '123@naver.com',  
'123 123','용인시','남동구' ,'A01', sysdate, 'myface.jpg', 'H'); 
 
 
SELECT id, passwd, mname, tel, email, zipcode, address1, address2, job, mdate, fname, grade 
FROM member 
ORDER BY id ASC; 

--중복아이디 검사 관련 sql
--0: 중복아님, 1:중복

SELECT COUNT(id)
FROM member
WHERE id = 'user1';

SELECT COUNT(id) as cnt
FROM member
WHERE id='user1';

--이메일 중복 확인
SELECT COUNT(email) as cnt
FROM member
WHERE email='email3@mail.com';

select * from member

user1 회원 정보 보기
SELECT id, passwd, mname, tel, email, zipcode, address1, address2, job, mdate, fname, grade
FROM member
WHERE id='user1';

회원 이미지의 수정
UPDATE member
SET fname=''
WHERE id = 'user1';

패스워드 변경
UPDATE member
SET passwd='1234'
WHERE id='';

SELECT id, mname, passwd
FROM member
ORDER BY id DESC;

회원 정보 수정
UPDATE member
SET passwd = 'TEST', tel='123-123', email='email10', zipcode='TEST',
address1='수원', address2='팔달구', job='TEST'
WHERE id = 'user3';

--이미지 수정
UPDATE member
SET fname = ''
WHERE id='';

--회원삭제
DELETE FROM member WHERE id='user3';
SELECT * FROM member;

--로그인 관련
SELECT COUNT(id) as cnt
FROM member
WHERE id = 'user1' AND passwd = '1234';

--list	
SELECT id, mname, tel, email, zipcode, address1, address2, fname, r
from(
	SELECT id, mname, tel, email, zipcode, address1, address2, fname,rownum r
	from(
		SELECT id, mname, tel, email, zipcode, address1, address2, fname 
		FROM member
		where mname like '%1%'
		ORDER BY mdate DESC
)
)WHERE r > = 1 and r < = 5;



select * from member;

delete member where id='444444';
update member set fname='5.jpg' where id='123';
