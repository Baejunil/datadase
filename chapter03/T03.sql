-- 1박지성이 구매한 도시의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
select distinct c.name
from orders o
join customer c on o.custid = c.custid
join book b on o.bookid = b.bookid
where b.publisher in (
    select b.publisher
    from orders o
    join customer c on o.custid = c.custid
    join book b on o.bookid = b.bookid
    where c.name = '박지성'
)
and c.name != '박지성';

-- 2두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
select c.name
from orders o
join customer c on o.custid = c.custid
join book b on o.bookid = b.bookid
group by c.name
having count(distinct b.publisher) >= 2;

--3전체 고객의 30% 이상이 구매한 도서
select b.bookname
from orders o
join book b on o.bookid = b.bookid
group by b.bookname
having count(distinct o.custid) >= (select count(*) * 0.30 from customer);

--4다음 EXISTS 질의의 결과를 보이시오
-- 1
SELECT *
FROM Customer ct
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders c2
    WHERE ct.custid = c2.custid
);
-- 결과 5	박세리	대한민국 대전	
--2 
SELECT *
FROM Customer ct
WHERE EXISTS (
    SELECT 1
    FROM Orders c2
    WHERE ct.custid = c2.custid
);
--결과값
-- 1	박지성	영국 맨체스타	000-5000-0001
--2	김연아	대한민국 서울	000-6000-0001
--3	장미란	대한민국 강원도	000-7000-0001
--4	추신수	미국 클리블랜드	000-8000-0001


--5번 표보고 테이블 생성하기
-- 극장 테이블 생성
create table theater (
    극장번호 number primary key,
    극장이름 varchar2(40) not null,
    위치 varchar2(40)
);

-- 상영관 테이블 생성
create table screen (
    극장번호 number,
    상영관번호 number,
    영화제목 varchar2(40) not null,
    가격 number(8, 2) not null,
    좌석수 number not null,
    primary key (극장번호, 상영관번호),
    foreign key (극장번호) references theater(극장번호)
);

-- 고객 테이블 생성
create table customer (
    고객번호 number primary key,
    이름 varchar2(40) not null,
    주소 varchar2(40)
);

-- 예약 테이블 생성
create table reservation (
    고객번호 number,
    극장번호 number,
    상영관번호 number,
    좌석번호 number,
    날짜 date,
    primary key (고객번호, 극장번호, 상영관번호, 좌석번호),
    foreign key (극장번호) references theater(극장번호),
    foreign key (상영관번호, 극장번호) references screen(상영관번호, 극장번호),
    foreign key (고객번호) references customer(고객번호)
);
--6번 판매원 테이터베이스
-- 고객 테이블 생성
create table customer (
    custname varchar2(40) primary key,  
    city varchar2(40),
    industrytype varchar2(40)
);

-- 판매원 테이블 생성
create table salesperson (
    name varchar2(40) primary key,  
    age number,
    salary number
);

-- 주문 테이블 생성
create table "order" (
    number number primary key,  
    custname varchar2(40), 
    salesperson varchar2(40),  
    amount number,
    foreign key (custname) references customer(custname),  
    foreign key (salesperson) references salesperson(name)  
);
-- 7번 기업 프로젝트 데이터 베이스

-- 사원 테이블 생성
create table employee (
    empno number primary key,  
    name varchar2(40) not null,  
    phoneno varchar2(40),  
    address varchar2(40),  
    sex varchar2(10), 
    position varchar2(40), 
    deptno number,  
    foreign key (deptno) references department(deptno)  
);

-- 부서 테이블 생성
create table department (
    deptno number primary key,  
    deptname varchar2(40) not null, 
    manager number,  
    foreign key (manager) references employee(empno) 
);

-- 프로젝트 테이블 생성
create table project (
    projno number primary key,  
    projname varchar2(40) not null,  
    deptno number, 
    foreign key (deptno) references department(deptno)  
);

-- 사원의 프로젝트 참여 테이블 생성
create table works (
    empno number,  
    projno number, 
    hours_worked number, 
    primary key (empno, projno), 
    foreign key (empno) references employee(empno), 
    foreign key (projno) references project(projno)  
);
