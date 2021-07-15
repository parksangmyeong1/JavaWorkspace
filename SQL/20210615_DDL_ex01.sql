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

desc phoneInfo_basic;
desc phoneInfo_univ;
desc phoneInfo_com;

drop table phoneInfo_univ;
drop table phoneInfo_com;
drop table phoneInfo_basic;
