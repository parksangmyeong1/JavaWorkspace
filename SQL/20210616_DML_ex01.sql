drop table phoneInfo_basic;
drop table phoneInfo_univ;
drop table phoneInfo_com;

create table phoneInfo_basic(
    idx NUMBER(6) constraint basic_idx_pk primary key,      -- 기본키 설정
    fr_name VARCHAR2(20) constraint fr_name_nn not null,    -- 친구이름 not null
    fr_phonenumber VARCHAR2(20) constraint fr_phonenumber_nn not null, -- 친구 전화번호 not null
    fr_email VARCHAR2(20),  -- 친구 이메일
    fr_address VARCHAR2(20),    --친구 주소
    fr_regdate DATE DEFAULT SYSDATE     -- 등록 시간 default 설정
);
desc phoneInfo_com;
create table phoneInfo_univ(
    idx NUMBER(6) constraint univ_idx_pk primary key,       -- 기본키 설정
    fr_u_major VARCHAR2(20) DEFAULT 'N' constraint fr_u_major_nn not null,  -- 대학친구 전공 정보 default 설정 not null
    fr_u_year NUMBER(1) default 1 constraint fr_u_year_nn not null  -- 대학친구 학년 default 설정 1~4 범위 not null
    constraint fr_u_year_check check (fr_u_year between 1 and 4),   
    fr_ref NUMBER(7) constraint univ_fr_ref_nn not null     -- 친구의 기본 정보 외래키 설정 not null
    constraint univ_ref_fk references phoneInfo_basic (idx)
);

create table phoneInfo_com(
    idx NUMBER(6) constraint idx_pk primary key,        -- 기본키 설정
    fr_c_company VARCHAR2(20) DEFAULT 'N' constraint fr_c_company_nn not null,  -- 회사친구 회사이름 default 설정 not null
    fr_ref NUMBER(6) constraint com_ref_fk references phoneInfo_basic (idx) -- 친구의 기본 정보 외래키 not null
                    constraint com_fr_ref_nn not null
);

-- phoneInfo_basic insert
insert into phoneInfo_basic values ('1','박철수','01015948731','pcs@naver.com','서울','210616');
insert into phoneInfo_basic values ('2','김미영','01016429587','kmy@hanmail.net','인천','210420');
insert into phoneInfo_basic values ('3','이수지','01035984751','lsj@google.com','광주','190921');
insert into phoneInfo_basic values ('4','최정길','01094682310','cjg@nate.com','안양','201231');
insert into phoneInfo_basic values ('5','정희원','01002416851','jhw@naver.com','대구','200322');
-- phoneInfo_basic update
update phoneInfo_basic set fr_name = '김철수' where fr_name = '박철수';
-- phoneInfo_basic delete
delete from phoneInfo_basic where fr_name = '김철수';
delete from phoneInfo_basic;
-- phoneInfo_basic select
select * from phoneInfo_basic order by idx;
rollback;

-- phoneInfo_univ select
select * from phoneInfo_univ;
-- phoneInfo_univ insert 를 위해 phoneInfo_basic
insert into phoneInfo_univ values ('1','수학',3,(select idx from phoneInfo_basic where fr_name = '김철수'));
insert into phoneInfo_univ values ('2','화학',2,(select idx from phoneInfo_basic where fr_name = '김미영'));
-- phoneInfo_univ update
update phoneInfo_univ set fr_u_major = '물리' where idx = 1;
-- phoneInfo_univ delete
delete from phoneInfo_univ where fr_u_major = '물리';
delete from phoneInfo_univ;

-- phoneInfo_com select
select * from phoneInfo_com order by idx;
-- phoneInfo_univ insert 를 위해 phoneInfo_basic
insert into phoneInfo_com values ((select nvl(max(idx),0)+1 from phoneInfo_com),'비트캠프',(select idx from phoneInfo_basic where fr_name = '이수지'));
insert into phoneInfo_com values ((select nvl(max(idx),0)+1 from phoneInfo_com),'효성캠프',(select idx from phoneInfo_basic where fr_name = '최정길'));
insert into phoneInfo_com values ((select nvl(max(idx),0)+1 from phoneInfo_com),'롯데캠프',(select idx from phoneInfo_basic where fr_name = '정희원'));
-- phoneInfo_univ update
update phoneInfo_com set fr_c_company = '신촌캠프' where idx = 1;
-- phoneInfo_univ delete
delete from phoneInfo_com where fr_c_company = '신촌캠프';
delete from phoneInfo_com;

-- basic & univ 1. inner join 2. outer join
select fr_name,fr_phonenumber,fr_email,fr_address,fr_regdate, fr_u_major, fr_u_year  from phoneInfo_basic b join phoneInfo_univ u on b.idx = u.fr_ref;
-- basic & com 1. inner join 2. outer join
select fr_name,fr_phonenumber,fr_email,fr_address,fr_regdate, fr_c_company from phoneInfo_basic b join phoneInfo_com c on b.idx = c.fr_ref;
-- all outer join
select fr_name,fr_phonenumber,fr_email,fr_address,fr_regdate, fr_u_major, fr_u_year,fr_c_company 
from phoneInfo_basic b 
full outer join phoneInfo_univ u on b.idx = u.fr_ref
full outer join phoneInfo_com c on b.idx = c.fr_ref;