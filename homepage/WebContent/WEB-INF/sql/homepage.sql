select * from homepage;
drop table homepage;

create table homepage(

    id       VARCHAR(10) NOT NULL, -- 아이디, 중복 안됨, 레코드를 구분하는 컬럼  
    passwd   VARCHAR(20) NOT NULL, -- 패스워드, 영숫자 조합 
    mname    VARCHAR(20) NOT NULL, -- 성명, 한글 10자 저장 가능 
    tel      VARCHAR(14)     NULL, -- 전화번호 
    email    VARCHAR(50) NOT NULL UNIQUE, -- 전자우편 주소, 중복 안됨 
    zipcode  VARCHAR(7)      NULL, -- 우편번호, 101-101 
    address1 VARCHAR(150)     NULL, -- 주소 1 
    address2 VARCHAR(50)     NULL, -- 주소 2 
    job      VARCHAR(20) NOT NULL, -- 직업 
    mdate    DATE        NOT NULL, -- 가입일     
    fname    VARCHAR(50) DEFAULT 'member.jpg', -- 회원 사진
    grade    CHAR(1)     DEFAULT 'H', -- 일반회원: H, 정지: Y, 손님:Z 
 
    PRIMARY KEY (id)               -- 한번 등록된 id는 중복 안됨 
); 


alter table homepage
add (grade char(1) DEFAULT 'H');

select * from MEMBER;

