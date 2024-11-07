--영화관
-- 극장 테이블 생성
create table theater (
    theaterid number primary key,
    theatername varchar2(40) not null,
    location varchar2(40) not null
);

-- 상영관 테이블 생성
create table screen (
    theaterid number,
    screenid number check (screenid between 1 and 10),
    movietitle varchar2(40) not null,
    price number(8, 2) check (price <= 20000),
    seats number not null,
    primary key (theaterid, screenid),
    foreign key (theaterid) references theater(theaterid) on delete cascade
);

-- 고객 테이블 생성
create table customer (
    customerid number primary key,
    name varchar2(40) not null,
    address varchar2(100) not null
);

-- 예약 테이블 생성
create table reservation (
    customerid number,
    theaterid number,
    screenid number,
    seatnumber number not null,
    date date not null,
    primary key (customerid, theaterid, screenid, seatnumber),
    foreign key (customerid) references customer(customerid) on delete cascade,
    foreign key (theaterid) references theater(theaterid) on delete cascade,
    foreign key (screenid, theaterid) references screen(screenid, theaterid) on delete cascade,
    constraint unique_seat_per_customer unique (customerid, seatnumber)
);
-- (1) 단순질의

-- 1. 모든 극장의 이름과 위치를 보이시오.
select theatername, location
from theater;

-- 2. 잠실에 있는 극장을 보이시오.
select theatername, location
from theater
where location like '%잠실%';

-- 3. 잠실에 사는 고객의 이름을 오름차순으로 보이시오.
select name
from customer
where address like '%잠실%'
order by name asc;

-- 4. 가격이 8,000원 이하인 영화의 극장번호, 상영관번호, 영화제목을 보이시오.
select theaterid, screenid, movietitle
from screen
where price <= 8000;

-- 5. 극장 위치와 고객의 주소가 같은 고객을 보이시오.
select c.name, c.address
from customer c
join theater t on c.address = t.location;

-- (2) 집계질의

-- 1. 극장의 수는 몇 개인가?
select count(*) as theater_count
from theater;

-- 2. 상영되는 영화의 평균 가격은 얼마인가?
select avg(price) as avg_price
from screen;

-- 3. 2020년 9월 1일에 영화를 관람한 고객의 수는 얼마인가?
select count(distinct customerid) as customer_count
from reservation
where date = to_date('2020-09-01', 'yyyy-mm-dd');

-- (3) 부속질의와 조인

-- 1. 대한극장에서 상영된 영화제목을 보이시오.
select movietitle
from screen
where theaterid = (select theaterid from theater where theatername = '대한극장');

-- 2. 대한 극장에서 영화를 본 고객의 이름을 보이시오.
select c.name
from customer c
join reservation r on c.customerid = r.customerid
join screen s on r.theaterid = s.theaterid and r.screenid = s.screenid
where s.theaterid = (select theaterid from theater where theatername like '%대한%');

-- 3. 대한 극장의 전체 수입을 보이시오.
select sum(price) as total_income
from screen
where theaterid = (select theaterid from theater where theatername = '대한극장');

-- (4) 그룹질의

-- 1. 극장별 상영관 수를 보이시오.
select theaterid, count(screenid) as screen_count
from screen
group by theaterid;

-- 2. 잠실에 있는 극장의 상영관을 보이시오.
select s.theaterid, s.screenid, s.movietitle
from screen s
join theater t on s.theaterid = t.theaterid
where t.location like '%잠실%';

-- 3. 2020년 9월 1일의 극장별 평균 관람 고객 수를 보이시오.
select r.theaterid, avg(customer_count) as avg_customer_count
from (
    select theaterid, screenid, count(distinct customerid) as customer_count
    from reservation
    where date = to_date('2020-09-01', 'yyyy-mm-dd')
    group by theaterid, screenid
) r
group by r.theaterid;

-- 4. 2020년 9월 1일에 가장 많은 고객이 관람한 영화를 보이시오.
select movietitle
from screen s
join reservation r on s.theaterid = r.theaterid and s.screenid = r.screenid
where r.date = to_date('2020-09-01', 'yyyy-mm-dd')
group by movietitle
order by count(r.customerid) desc
fetch first 1 row only;

-- (5) DML

-- 1. 각 테이블에 데이터를 삽입하는 INSERT 문을 하나씩 실행시켜 보시오.
insert into theater (theaterid, theatername, location)
values (1, '대한극장', '서울 잠실');
insert into customer (customerid, name, address)
values (1, '홍길동', '서울 잠실');
insert into screen (theaterid, screenid, movietitle, price, seats)
values (1, 1, '어벤져스', 12000, 150);
insert into reservation (customerid, theaterid, screenid, seatnumber, date)
values (1, 1, 1, 1, to_date('2020-09-01', 'yyyy-mm-dd'));

-- 2. 영화의 가격을 10%씩 인상하시오.
update screen
set price = price * 1.10;

-- 판매원 테이터베이스

-- 고객 테이블 생성
create table customer (
    cname varchar2(40) primary key,  
    city varchar2(40),
    Occupation varchar2(40)
);

-- 판매원 테이블 생성
create table salesperson (
    sname varchar2(40) primary key,  
    age number,
    salary number
);

-- 주문 테이블 생성
create table "order" (
    number number primary key,  
    cname varchar2(40), 
    salesperson varchar2(40),  
    amount number,
    foreign key (cname) references customer(cname),  
    foreign key (salesperson) references salesperson(sname)  
);

-- 고객 데이터 삽입
insert into customer (cname, city, Occupation)
values ('요시다 마야', ' LA', 'LAGalaxy Football player');
insert into customer (cname, city, Occupation)
values ('마르코 로이스', 'LA', 'LAGalaxy Football player');
insert into customer (cname, city, Occupation)
values ('손흥민', 'rondon', 'Tottenham Hotspur Football player');
insert into customer (cname, city, Occupation)
values ('파페 마타르 사르', 'rondon', 'Tottenham Hotspur Football player');

-- 판매원 데이터 삽입
insert into salesperson (sname, age, salary)
values ('다니엘 레비', 62, 5000000);
insert into salesperson (sname, age, salary)
values ('위고 요리스', 37, 1000000);
insert into salesperson (sname, age, salary)
values ('호나우두', 48, 5000000);
insert into salesperson (sname, age, salary)
values ('주안 라포르타', 62, 6000000);

-- 주문 데이터 삽입
insert into "order" (number, cname, salesperson, amount)
values (1, '요시다 마야', '위고 요리스', 15000);

insert into "order" (number, cname, salesperson, amount)
values (2, '마르코 로이스', '위고 요리스', 20000);

insert into "order" (number, cname, salesperson, amount)
values (3, '손흥민', '다니엘 레비', 25000);

insert into "order" (number, cname, salesperson, amount)
values (4, '파페 마타르 사르', '다니엘레비', 30000);

-- 2. 모든 판매원의 이름과 급여를 보이시오 단. 중복 행은 제거해야 한다
select distinct sname, salary
from salesperson;

-- 3. 나이가 30세 미만인 판매원의 이름을 보이시오
select sname
from salesperson
where age < 30;

-- 4. S로 끝나는 도시에 사는 고객의 이름을 보이시오
select cname
from customer
where city like '%S';

-- 5. 주문을 한 고객의수(서로 다른 고객만)를 구하시오
select count(distinct cname) as customer_count
from "order";

-- 6. 판매원 각각에 대하여 주문의 수를 계산하시오
select salesperson, count(*) as order_count
from "order"
group by salesperson;

-- 7. LA에 사는 고객으로부터 주문을 받은 판매원의 이름과 나이를 보이시오(부속질의를 사용)
select s.sname, s.age
from salesperson s
where s.sname in (
    select o.salesperson
    from "order" o
    join customer c on o.cname = c.cname
    where c.city = 'LA'
);

-- 8. LA에 사는 고객으로부터 주문을 받은 판매원의 이름과 나이를 보이시오(조인을 사용)
select s.sname, s.age
from salesperson s
join "order" o on s.sname = o.salesperson
join customer c on o.cname = c.cname
where c.city = 'LA';

-- 9. 두 번 이상 주문을 받은 판매원의 이름을 보이시오.
select salesperson
from "order"
group by salesperson
having count(*) >= 2;

-- 10. 판매원 TOM의 봉급을 45,000원으로 변경하는 SQL문을 작성하시오
update salesperson
set salary = 45000
where sname = 'TOM';
-- 기업 프로젝트 데이터베이스
-- (1) 기존 테이블 삭제 (있으면)
begin
    execute immediate 'drop table works cascade constraints';
    execute immediate 'drop table project cascade constraints';
    execute immediate 'drop table department cascade constraints';
    execute immediate 'drop table employee cascade constraints';
exception
    when others then
        null; -- 테이블이 없으면 무시
end;
/

-- (2) 테이블 생성

create table employee (
    empno int primary key,
    name varchar2(50),
    phoneno varchar2(20),
    address varchar2(100),
    sex char(1),
    position varchar2(20),
    deptno int
);

create table department (
    deptno int primary key,
    deptname varchar2(50),
    manager int,
    constraint fk_manager foreign key (manager) references employee(empno)
);

create table project (
    projno int primary key,
    projname varchar2(100),
    deptno int,
    constraint fk_deptno foreign key (deptno) references department(deptno)
);

create table works (
    empno int,
    projno int,
    hours_worked int,
    primary key (empno, projno),
    constraint fk_empno foreign key (empno) references employee(empno),
    constraint fk_projno foreign key (projno) references project(projno)
);

-- (3) 데이터 삽입

-- employee 테이블에 데이터 삽입
insert into employee (empno, name, phoneno, address, sex, position, deptno) 
values (1, '홍길동', '010-1234-5678', '서울시 강남구', 'm', '팀장', 1);
insert into employee (empno, name, phoneno, address, sex, position, deptno) 
values (2, '김철수', '010-2345-6789', '서울시 마포구', 'm', '사원', 1);
insert into employee (empno, name, phoneno, address, sex, position, deptno) 
values (3, '이영희', '010-3456-7890', '서울시 송파구', 'f', '사원', 2);
insert into employee (empno, name, phoneno, address, sex, position, deptno) 
values (4, '박민수', '010-4567-8901', '서울시 강서구', 'm', '사원', 2);
insert into employee (empno, name, phoneno, address, sex, position, deptno) 
values (5, '정지은', '010-5678-9012', '서울시 종로구', 'f', '사원', 3);
insert into employee (empno, name, phoneno, address, sex, position, deptno) 
values (6, '최재호', '010-6789-0123', '서울시 용산구', 'm', '사원', 3);

-- department 테이블에 데이터 삽입
insert into department (deptno, deptname, manager) 
values (1, 'it', 1);
insert into department (deptno, deptname, manager) 
values (2, 'hr', 3);
insert into department (deptno, deptname, manager) 
values (3, 'finance', 5);

-- project 테이블에 데이터 삽입
insert into project (projno, projname, deptno) 
values (101, '프로젝트a', 1);
insert into project (projno, projname, deptno) 
values (102, '프로젝트b', 2);
insert into project (projno, projname, deptno) 
values (103, '프로젝트c', 3);

-- works 테이블에 데이터 삽입
insert into works (empno, projno, hours_worked) 
values (1, 101, 40);
insert into works (empno, projno, hours_worked) 
values (2, 101, 35);
insert into works (empno, projno, hours_worked) 
values (3, 102, 20);
insert into works (empno, projno, hours_worked) 
values (4, 102, 30);
insert into works (empno, projno, hours_worked) 
values (5, 103, 50);
insert into works (empno, projno, hours_worked) 
values (6, 103, 25);


select * from employee where deptno in (select deptno from department);


-- (2) 모든 사원의 이름을 보이시오
select name from employee;

-- (3) 여자 사원의 이름을 보이시오
select name from employee where sex = 'f';

-- (4) 팀장(manager)의 이름을 보이시오
select e.name
from employee e
join department d on e.empno = d.manager;

-- (5) it 부서에서 일하는 사원의 이름과 주소를 보이시오
select e.name, e.address
from employee e
join department d on e.deptno = d.deptno
where d.deptname = 'it';

-- (6) '홍길동' 팀장(manager) 부서에서 일하는 사원의 수를 보이시오
select count(*)
from employee e
join department d on e.deptno = d.deptno
where d.manager = (select empno from employee where name = '홍길동');

-- (7) 사원들이 일한 시간 수를 부서별, 사원 이름별 오름차순으로 보이시오
select d.deptname, e.name, sum(w.hours_worked) as total_hours
from works w
join employee e on w.empno = e.empno
join department d on e.deptno = d.deptno
group by d.deptname, e.name
order by d.deptname, e.name;

-- (8) 2명 이상의 사원이 참여한 프로젝트의 번호, 이름, 사원의 수를 보이시오
select p.projno, p.projname, count(w.empno) as employee_count
from project p
join works w on p.projno = w.projno
group by p.projno, p.projname
having count(w.empno) >= 2;

-- (9) 3명 이상의 사원이 있는 부서의 사원 이름을 보이시오
select e.name
from employee e
join department d on e.deptno = d.deptno
group by e.deptno
having count(e.empno) >= 3;
