--사원정보Employees 테이블에서 사원번호, 이름, 급여, 업무, 입사일, 상사의 사원번호를 출력하시오
--이때 이름은 성과 이름을 연결하여 Name이라는 별칭으로 출력하시오
select employee_id, 
       first_name || ' ' || last_name as "name", 
       salary, 
       job_id, 
       hire_date, 
       manager_id
from employees;

--문제 1번
--  사원정보 테이블에서 사원의 성과 이름 업무 급여 연봉에 100 보너스를 추가하여
-- 계산한 연봉은 급여에 $100보너스를 추가하여 Increased Salary 별칭으로 출력하시오 
select first_name || ' ' || last_name as "name", 
       job_id, 
       salary, 
       salary + 100 as "increased salary"
from employees;

--문제 2번
--사원정보(Employees) 테이블에서 모든 사원의 성(last name)과 연봉을 "성: 1 Year Salary = $
--연봉" 형식으로 출력하고, "1 Year Salary"라는 별칭을 붙여 출력하시오
select last_name || ': 1 year salary = $' || salary as "1 year salary"
from employees;

-- 문제3번
-- 부서별로 담당하는 업무를 한 번씩만 출력하시오 
select department_id, job_id
from employees
group by department_id, job_id;

-- 샘플문제
-- HR 부서에서 예산 편성 문제로 급여 정보 보고서를 작성하려고 한다 사원정보 테이블에서
-- 급여가 $7000~10000 범위 이외인 사람의 성과 이름 및 급여를 급여가 적은 순서로 출력하시오
select first_name || ' ' || last_name as "Name", salary
from employees
where salary not between 7000 and 10000
order by salary;

--문제1번
--사원의 이름(last_ name) 중에 'e' 및 'o' 글자가 포함된 사원을 출력하시오. 이때 머리글은 'e and o
--Name'이라고 출력하시오
select last_name as "e and o Name"
from employees
where last_name like '%e%' and last_name like '%o%';

--문제 2번
--날짜 함수로 이용해 2006년 05월 20일부터 2007년 05월 20일 사이에 고용된 사원들의 성과 이름
--(Name으로 별칭). 사원번호, 고용일자를 출력하시오. 단, 입사일이 빠른 순으로 정렬하시오
select first_name || ' ' || last_name as "Name", 
       employee_id, 
       hire_date
from employees
where hire_date between to_date('2006-05-20', 'yyyy-mm-dd') 
                    and to_date('2007-05-20', 'yyyy-mm-dd')
order by hire_date;

--문제 3번
--수당을 받는 모든 사원의 성과 이름(Name으로 별칭), 급여(salary), 업무,수당률(commission
--pct)을 출력하시오. 급여가 많은 순서대로 정렬하되, 급여가 같으면 수당률이 큰 순서대로 정렬하시오
select first_name || ' ' || last_name as "Name", 
       salary, 
       job_id, 
       commission_pct
from employees
where commission_pct is not null
order by salary desc, commission_pct desc;

--샘플문제
--신규 프로그램을 개발해 회사에 공현한 IT 부서의 사원 급여를 12.3% 인상하기로 하였다. 60번 IT 부
--서 사원의 급여를 12.3% 인상하여 정수만(반올림) 표시하는 보고서를 작성하시오. 출력 형식은 사번,
--이름과 성(Name으로 별칭), 급여, 인상된 급여(Increased Salary로 별칭) 순으로 출력한다.
select employee_id,
       first_name || ' ' || last_name as "Name",
       salary,
       round(salary * 1.123) as "Increased Salary"
from employees
where job_id = 'IT_PROG' -- IT 부서에 해당하는 사원
and department_id = 60; -- 60번 부서
--문제 1번
--성(last_ name)이 's로 끝나는 사원의 이름과 업무를 아래의 예와 같이 출력하고자 한다. 이름(first_
--name)과 성(last_ name)은 첫 자만 대문자, 업무는 모두 대문자, 머리글은 "Employee JOBs."로 표
--시하시오
select initcap(first_name) || ' ' || initcap(last_name) as "Name", 
       upper(job_id) as "Job"
from employees
where last_name like '%s'
order by last_name;
--문제 2번
-- 모든 사원의 연봉을 표시하는 보고서를 작성하려고 한다. 보고서에 사원의 성과 이름,급여,수당 여부에따라
-- 연봉을 포함하여 출력하시오 수당 여부는 수당이 있으면 "Salary + Commission". 수당이없으면
-- "Salary only" 라고 표시하고 별칭은 적절히 붙인다 또한 출력 시 연봉이 높은순으로 정렬한다
select last_name || ', ' || first_name as "Name", 
       salary, 
       case 
           when commission_pct is not null then 'Salary + Commission' 
           else 'Salary only' 
       end as "Salary Type",
       salary + nvl(commission_pct, 0) * salary as "Annual Salary"
from employees
order by "Annual Salary" desc;
--문제 3
--모든 사원의 성과 이름(Name으로 별칭), 입사일, 입사 요일을 출력하시오. 이때 주(week)의 시작
--인 일요일부터 출력되도록 정렬하시오
select last_name || ', ' || first_name as "Name", 
       hire_date, 
       to_char(hire_date, 'Day') as "Hire Day"
from employees
order by to_char(hire_date, 'D') asc;
--샘플문제
--모든 사원은 직속 상사 및 직속 직원을 갖는다. 단, 최상위 또는 최하위 직원은 직속 상사 및 직원이
--없다. 소속된 사원들 중 어떤 사원의 상사로 근무 중인 사원의 총수를 출력하시오
select count(distinct manager_id) as "Total Managers"
from employees
where manager_id is not null;

-- 문제 1번 각 사원의 부서별로 급여 합계, 급여 평균, 급여 최댓값, 급여 최솟값을 집계하고자한다
-- 계산 값은 여섯자리와 세자리 구분기호 $와 함께 출력하고 부서번호의 오름차순으로 정렬하시오 단 부서에
-- 소속되지 않은 사원에 대한 정보는 제외하고 출력시 머리글은 다음 그림처럼 별칭하시오select department_id,
select department_id,
       to_char(sum(salary), '$99,999.00') as "Sum Salary",
       to_char(avg(salary), '$99,999.00') as "Avg Salary",
       to_char(max(salary), '$99,999.00') as "Max Salary",
       to_char(min(salary), '$99,999.00') as "Min Salary"
from employees
where department_id is not null
group by department_id
order by department_id;

