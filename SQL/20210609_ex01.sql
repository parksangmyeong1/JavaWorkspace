select * from tab;
DESC tab;
DESC dept;

select * from emp;

select empno, ename
from emp;

select sal, comm, sal*comm, sal*12, sal/10, sal-100, sal+100
from emp;

select ename, job, sal, comm, sal*12 as ysall, sal*12+comm as ysa12
from emp;

select ename, job, sal, nvl(comm,0), sal*12 as ysall, sal*12+nvl(comm,0) as ysa12
from emp;