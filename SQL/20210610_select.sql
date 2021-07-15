-- 2021.06.10

-- 특정 데이터 검색 : 행 검색 -> 컬럼 선택

-- 10번 부서의 사원 리스트를 출력
-- 10번 부서 -> where dept=10
select * from emp;
select * from emp where deptno=10;

-- 이름이 'SCOTT'인 사원을 출력
select * from emp where ename='SCOTT';

-- 날짜타입의 데이터 비교시에도 작은 따옴표를 이용해야 한다.
select * from emp where hiredate = '96/11/17';

-- 논리연산자 : and, or, not
-- 10번 부서의 관리자(manager)를 찾아 출력
select * from emp where deptno=10 and job='MANAGER';
-- 10번 부서의 직원들과 관리자들의 리스트를 출력
select * from emp where deptno=10 or job='MANAGER';
--10번 부서의 직원을 제외한 나머지 직원들을 출력
select * from emp where not deptno = 10;

-- 범위 연산을 할 때 -> 논리연산자 이용, between a and b
-- between a and b : a 이상 ~ b 이하

-- 2000 이상 3000이하의 급여를 받는 직원의 리스트
select * from emp where sal between 2000 and 3000;

-- 1981년도에 입사한 직원의 리스트
select * from emp where hiredate between '1981/01/01' and '1981/12/31' order by hiredate;

-- 연산자 in -> 여러개의 or 연산자 사용시 대체 할 수 있다.
-- select * from emp where comm=300 or comm=500 or comm=1400;
select * from emp where comm in(300,500,1400);

-- 패턴 검색 : 키워드 검색 많이 사용 (게시판)
-- 컬럼 like '%' 이용
-- ename like 'S%' -> S로 시작하는 이름을 가진 사원을 검색
select * from emp where ename like 'S%';
-- ename like 'S%' -> S로 끝나는 이름을 가진 사원을 검색
select * from emp where ename like '%S';
-- ename like 'S%' -> S를 포함하는 이름을 가진 사원을 검색
select * from emp where ename like '%S%';

-- 자리수 패턴 : 컬럼의 값이 자리수가 정해져 있고 값에 패턴이 있는 경우
-- 이름에 두번째 문자에 A를 포함하는 사원의 리스트
select * from emp where ename like '_A%';
-- 이름에 세번째 문자에 A를 포함하는 사원의 리스트
select * from emp where ename like '__A%';
-- 이름에 두번째 문자에 A를 포함하지 않는 사원의 리스트
select * from emp where ename not like '__A%';

-- null 값을 확인하는 연산자 -> is nul, is not null
-- 커미션이 등록되어 있지 않은 사원의 리스트
select * from emp where comm is null;
select * from emp where comm is not null;
select * from emp where comm is not null order by comm;

-- 결과 행의 정렬 : order by 컬럼 [asc|desc]
-- 급여가 작은 사원부터 출력 : 오름차순 -> asc(생략가능)
select * from emp order by sal;
select * from emp order by sal desc;

-- 급여가 큰 사원부터 출력하고 급여가 같은 사원은 이름을 기준으로 오름차순
select * from emp order by sal desc, ename asc;