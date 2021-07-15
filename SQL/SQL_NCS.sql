-- #1 아래 요구사항에 맞도록 기본 SQL 문을 작성하시오.

-- 1. 아래 조건에 맞는 DDL을 작성하시오.
-- ===== 전화번호 부( 테이블 이름 : Contact )
------ 기본정보(not null)
-- 대리키 : 일련번호 -> pIdx 기본키로 설정
-- 이름, 전화번호, 주소, 이메일
-- 주소값과 이메일은 입력이 없을 때 기본값 입력
-- 친구의 타입 (카테고리) : univ, com, cafe 세가지 값만 저장 가능
------ 선택 정보
-- 전공, 학년
-- 회사이름, 부서이름, 직급
-- 모임이름, 닉네임
-- =============================

create table Contact (
-- standard information
pIdx number(6) constraint pIdx_pk primary key constraint pIdx_nn not null,
name varchar(20) constraint name_nn not null,
phone varchar(20) constraint phone_nn not null,
address varchar(20) default '미입력' constraint addr_nn not null,
email varchar(20) default '미입력' constraint email_nn not null,
fr_type varchar(5) constraint type_ch check (fr_type in ('univ','com','cafe')) constraint type_nn not null,

-- select information
major varchar(20),
grade number(1),
com_name varchar(20),
dept_name varchar(20),
com_postion varchar(20),
group_name varchar(20),
nickname varchar(20)
);

select * from Contact;

-- 2. DEPT 테이블에 데이터를 삽입하는 SQL을 작성하시오. 입력 데이터는 임의로 작성하시오.
select * from dept;
insert into dept values (50,'DEV','SEOUL');

-- 3. DEPT 테이블에 위에서 삽입한 데이터의 dname, loc 데이터를 변경하는 SQL을 작성하시오.
update dept set dname = 'DESIGN', loc = 'BUSAN' where deptno = 50; 

-- 4. DEPT 테이블에 위에서 삽입한 데이터를 deptno 컬럼의 값을 기반으로 삭제하는 SQL을 작성하시오.
delete from dept where deptno = 50;

-- 5. 사용자가 보유한 테이블 목록을 확인하는 SQL문을 작성하시오.
select * from tab;

-- 6. EMP 테이블의 구조를 확인하는 SQL을 작성하시오.
desc emp;

-- 7. 사용자가 정의한 제약조건들을 확인하는 SQL문을 작성하시오.
-- 테이블 이름은 무조건 대문자
select * from all_constraints where table_name = 'CONTACT';

-- #2 아래 요구사항에 맞도록 고급 SQL 문을 작성하시오.

-- 1. EMP 테이블의 ename 컬럼에 인덱스를 생성하는 SQL을 작성하시오. 인덱스의 이름은 emp_index
create index emp_index on emp(ename);

-- 2. 2. EMP 테이블과 DEPT 테이블을 조인하는 SQL을 기반으로 view 객체를 생성하는 SQL을 작성하시오.
-- view 의 이름은 emp_view 로 하시오.
create or replace view emp_view
as
select empno, ename, job, mgr, hiredate, sal, e.deptno, dname, loc
from emp e
join dept d
on e.deptno = d.deptno;

select * from emp_view;

-- 3. EMP 테이블에서 모든 사원의 부서번호를 이름이 'SCOTT'인 사원의 부서번호로 변경하는 SQL을 작성하시오.
update emp02 set deptno = (select deptno from emp where ename = 'SCOTT');