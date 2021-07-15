-- 자주 사용되는
-- 30번 부서에 소속된 사원들의 사번과 이름과 부서번호를 출력하기 위한
-- select문을 하나의 뷰로 정의해 봅시다.

create or replace view emp_view30 as select empno, ename, deptno from emp where deptno = 30;

select * from emp_view30 where ename = 'JAMES';

-- view 삭제
drop view emp_view30;

-- 인라인 뷰를 이용한 TOP3 구하기
-- 둘의 결과 다름
select rownum, ename from emp order by ename; -- 오답
select rownum, ename from (select * from emp order by ename); -- 정답

-- 사원 중에서 입사일이 빠른 사람 5명(TOP-5)만을 얻어 오는 질의문을 작성
select rownum, ename, hiredate from (select * from emp order by hiredate) where rownum<6;
-- 입사일이 제일 늦은 5명
select rownum, ename, hiredate from (select * from emp order by hiredate desc) where rownum<6;

-- view 이용하고 입사일이 빠른 5명 구하기 (이름순으로 정렬)
select * from emp order by hiredate;
create or replace view view_HIR as select * from emp order by hiredate;
select rownum, ename, hiredate from view_hir where rownum < 6 order by ename;
--------------------------------------------------------------------------------
-- sequence : 번호 재생기
create sequence pi_idx_pk;

-- 시퀀스 다음 값 가져오기
select pi_idx_pk.nextval from dual;
-- 시퀀스 현재 값 가져오기
select pi_idx_pk.currval from dual;