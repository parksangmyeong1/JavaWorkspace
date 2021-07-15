-- 20210614

-- sub query

-- 스칼라 부속 질의 : select 절 이후에 사용

select o.custid, (select c.name from customer c where o.custid = c.custid) as name
from orders o;

-- emp 테이블만 사용해서 사원 이름, 부서이름 출력
select e.ename, (select d.dname from dept d where e.deptno=d.deptno) as dname from emp e;

select ename, dname from emp, dept where emp.deptno = dept.deptno;

-- 마당서점의
-- 고객별
-- 판매액을 보이시오
-- (결과는 고객이름과 고객별 판매액을 출력).
-- join
select c. custid, c.name, sum(o.saleprice) as "판매액" from orders o, customer c 
where o.custid = c.custid group by c. custid, c.name;

-- 스칼라 부족질의 이용
select custid, (select name from customer c where o.custid = c.custid) as name,
               sum(o.saleprice) as "구매액"
from orders o group by custid;

-- 인라인 뷰 : from 절 뒤에 사용되는 부속질의, 가상 테이블처럼 사용
-- 고객번호가 2이하인 -> customer 
-- 고객의 판매액을 보이시오 -> orders
-- (결과는 고객이름과 고객별 판매액 출력)
select * from (select * from customer where custid<=2) c, orders o
where c.custid = o. custid;

-- 중첩질의 : where 절 뒤에 사용하는 부속질의
-- 비교연산자를 이용할 때는 단일행 단일열의 결과를 같는 부속질의를 사용
-- > < = != >= <=
-- 평균 급여보다 select avg(sal) from emp
-- 더 많은 급여를 받는 사원을 검색
select ename as "사원이름" from emp where sal > (select avg(sal) from emp) order by ename;

-- 평균 주문금액 이하의 주문에 대해서 
-- 주문번호와 금액을 보이시오. --> orders
select orderid as "주문번호", saleprice as "금액" from orders 
where saleprice <= (select avg(saleprice) from orders) order by saleprice;

-- 각 고객의 평균 주문금액보다 
-- 큰 금액의 주문 내역에 대해서 
-- 주문번호, 고객번호, 금액을 보이시오.
select avg(saleprice) from orders o2 where o2.custid=o1.custid;
select orderid as "주문번호", custid as "고객번호", saleprice as "금액" from orders o1 
where saleprice>(select avg(saleprice) from orders o2 where o2.custid=o1.custid);

-- 3000 이상 받는 사원이 소속된 부서와 동일한 부서에서 근무하는 사원
select ename as "사원이름", sal as "급여", deptno as "부서번호" from emp where deptno 
in (select distinct deptno from emp where sal>=3000) order by deptno, ename;

-- 대한민국에 거주하는 고객에게 
-- 판매한 도서의 총 판매액을 구하시오.
select sum(saleprice) as "총 판매액" from orders where custid 
in (select custid from customer where address like '%대한민국%');

--3번 고객이 주문한 도서의 최고 금액보다 
-- 더 비싼 도서를 구입한 주문의 
-- 주문번호와 금액을 보이시오. 
-- 1. max 이용
select orderid as "주문번호", saleprice as "금액" from orders 
where saleprice > (select max(saleprice) from orders where custid =3) order by orderid;
-- 2. all 이용
select orderid as "주문번호", saleprice as "금액" from orders 
where saleprice > all(select saleprice from orders where custid =3) order by orderid;

-- 부서번호가 30번인 사원들의 급여 중 가장 작은 값(950)보다 많은 급여를 받는 사원의 이름, 급여를 출력하는 예제를 작성해 봅시다.
-- 1. min 이용
select ename as "사원이름", sal as "급여" from emp 
where sal > (select min(sal) from emp) order by ename;
-- 2. any 이용
select ename as "사원이름", sal as "급여" from emp 
where sal > any(select sal from emp) order by ename;

-- EXISTS 연산자로 대한민국에 거주하는 고객에게 
-- 판매한 도서의 총 판매액을 구하시오.
select sum(saleprice) as "총 판매액" from orders o where 
exists (select * from customer c where o.custid = c.custid and address like '%대한민국%');