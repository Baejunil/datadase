-- 1. 절댓값 반환 (ABS)
select abs(-15) from dual;  -- ABS: 절댓값을 반환
-- 2. 숫자 올림 (CEIL)
select ceil(15.7) from dual;  -- CEIL: 숫자를 올림하여 정수로 반환
-- 3. 코사인 값 반환 (COS)
select cos(3.14159) from dual;  -- COS: 주어진 라디안 값에 대한 코사인 반환
-- 4. 숫자 내림 (FLOOR)
select floor(15.7) from dual;  -- FLOOR: 숫자를 내림하여 정수로 반환
-- 5. 로그 값 반환 (LOG)
select log(10, 100) from dual;  -- LOG: 주어진 진법에 대한 로그 값 반환
-- 6. 나머지 반환 (MOD)
select mod(11, 4) from dual;  -- MOD: 두 숫자의 나머지 반환
-- 7. 거듭제곱 값 반환 (POWER)
select power(3, 2) from dual;  -- POWER: 거듭제곱 값 반환
-- 8. 반올림 (ROUND)
select round(15.7, 0) from dual;  -- ROUND: 숫자를 주어진 자릿수로 반올림
-- 9. 숫자의 부호 반환 (SIGN)
select sign(-15) from dual;  -- SIGN: 숫자의 부호 반환 (-1: 음수, 1: 양수)
-- 10. 숫자 잘라내기 (TRUNC
select trunc(15.7) from dual;  -- TRUNC: 숫자를 주어진 자릿수로 잘라냄
-- 11. ASCII 문자 반환 (CHR)
select chr(67) from dual;  -- CHR: ASCII 값을 문자로 변환
-- 12. 문자열 연결 (CONCAT)
select concat('HAPPY', 'Birthday') from dual;  -- CONCAT: 두 문자열을 이어붙임
-- 13. 문자열 대문자로 변환 (UPPER)
select upper('birthday') from dual;  -- UPPER: 문자열을 대문자로 변환
-- 14. 문자열 왼쪽을 문자로 채우기 (LPAD)
select lpad('Page 1', 15, '*') from dual;  -- LPAD: 문자열의 왼쪽을 지정된 문자로 채워서 길이 맞추기
-- 15. 문자열 왼쪽에서 지정된 문자 제거 (LTRIM)
select ltrim('Page 1', 'ae') from dual;  -- LTRIM: 문자열의 왼쪽에서 지정된 문자들을 제거
-- 16. 문자열 대체 (REPLACE)
select replace('JACK', 'J', 'BL') from dual;  -- REPLACE: 문자열 내의 특정 문자를 다른 문자로 대체
-- 17. 문자열 오른쪽을 문자로 채우기 (RPAD)
select rpad('Page 1', 15, ' ') from dual;  -- RPAD: 문자열의 오른쪽을 지정된 문자로 채워서 길이 맞추기
-- 18. 문자열 오른쪽에서 지정된 문자 제거 (RTRIM)
select rtrim('Page 1', 'ae') from dual;  -- RTRIM: 문자열의 오른쪽에서 지정된 문자들을 제거
-- 19. 부분 문자열 추출 (SUBSTR)
select substr('ABCDEFG', 3, 4) from dual;  -- SUBSTR: 문자열의 일부분을 추출
-- 20. 문자열 앞부분에서 문자 제거 (TRIM)
select trim(leading '0' from '00AA00') from dual;  -- TRIM: 문자열의 앞부분에서 지정된 문자를 제거
-- 21. 문자열을 소문자로 변환 (LOWER)
select lower('BIRTHDAY') from dual;  -- LOWER: 문자열을 소문자로 변환
-- 22. ASCII 값 반환 (ASCII)
select ascii('A') from dual;  -- ASCII: 문자에 해당하는 ASCII 값 반환
-- 23. 문자열 위치 찾기 (INSTR)
select instr('CORPORATE FLOOR', 'OR', 3, 2) from dual;  -- INSTR: 문자열에서 특정 패턴의 위치 반환
-- 24. 문자열 길이 반환 (LENGTH)
select length('Birthday') from dual;  -- LENGTH: 문자열의 길이 반환
-- 25. 날짜에 월 추가 (ADD_MONTHS
select add_months(to_date('14/05/21', 'DD/MM/YY'), 1) from dual;  -- ADD_MONTHS: 날짜에 월 수를 더함
-- 26. 날짜의 마지막 날 반환 (LAST_DAY)
select last_day(sysdate) from dual;  -- LAST_DAY: 주어진 날짜의 월의 마지막 날 반환
-- 27. 지정된 요일의 날짜 반환 (NEXT_DAY)
select next_day(sysdate, '화') from dual;  -- NEXT_DAY: 주어진 날짜 이후 가장 가까운 지정된 요일 반환
-- 28. 날짜 반올림 (ROUND)
select round(sysdate) from dual;  -- ROUND: 날짜를 반올림하여 가장 가까운 날짜로 반환
-- 29. 시스템 날짜 및 시간 반환 (SYSDATE)
select sysdate from dual;  -- SYSDATE: 현재 시스템 날짜 및 시간 반환
-- 30. 날짜를 문자열 형식으로 변환 (TO_CHAR)
select to_char(sysdate, 'YYYY-MM-DD') from dual;  -- TO_CHAR: 날짜를 문자열 형식으로 변환
-- 31. 숫자를 문자열로 변환 (TO_CHAR)
select to_char(123) from dual;  -- TO_CHAR: 숫자를 문자열로 변환
-- 32. 문자열을 날짜로 변환 (TO_DATE)
select to_date('12 05 2020', 'DD MM YYYY') from dual;  -- TO_DATE: 문자열을 날짜 형식으로 변환
-- 33. 문자열을 숫자로 변환 (TO_NUMBER)
select to_number('12,3', '999.9') from dual;  -- TO_NUMBER: 문자열을 숫자로 변환
-- 34. 값 비교 (DECODE)
select decode(1, 1, 'aa', 'bb') from dual;  -- DECODE: 조건에 따라 다른 값을 반환
-- 35. NULL 값 비교 (NULLIF)
select nullif(123, 345) from dual;  -- NULLIF: 두 값이 같으면 NULL 반환
-- 36. NULL 값 처리 (NVL)
select nvl(null, 123) from dual;  -- NVL: NULL 값을 다른 값으로 대체

-- 2 sql 문 실행 후 결과 설명
-- Mybook 테이블 생성
-- mybook 테이블 생성
create table mybook (
    bookid number,
    price number
);
-- 데이터 삽입
insert into mybook (bookid, price) values (1, 10000);
insert into mybook (bookid, price) values (2, 20000);
insert into mybook (bookid, price) values (3, null);
-- 테이블 내용 확인
select * from mybook;

-- (1) select * from mybook;
-- 설명: mybook 테이블의 모든 데이터를 조회합니다.
select * from mybook;
--2	20000
--1	10000
--3	null
-- (2) select bookid, nvl(price, 0) from mybook;
-- 설명: price가 null인 경우, 0으로 대체하여 조회합니다.
select bookid, nvl(price, 0) from mybook;
-- 2	20000
-- 1	10000
-- 3	0
-- (3) select * from mybook where price is null;
-- 설명: price가 null인 행만 조회합니다.
select * from mybook where price is null;
-- 3	null
-- (4) select * from mybook where price = '';
-- 설명: price가 빈 문자열('')인 행을 조회한다
-- 아무것도 안나온다 
select * from mybook where price = '';

-- (5) select bookid, price + 100 from mybook;
-- 설명: price에 100을 더한 값을 조회합니다.
-- price가 null인 경우, null이 반환됩니다.
select bookid, price + 100 from mybook;
--2	20100
--1	10100
--3 null	
-- (6) select sum(price), avg(price), count(*) from mybook where bookid >= 4;
-- 설명: bookid가 4 이상인 행에 대해 sum(price), avg(price), count(*)를 계산합니다.
--  null null 0
select sum(price), avg(price), count(*) from mybook where bookid >= 4;

-- (7) select count(*), count(price) from mybook;
-- 설명: 전체 행 수를 count(*)로 구하고, price 컬럼이 null이 아닌 값의 개수를 count(price)로 구합니다.
select count(*), count(price) from mybook; -- 3 2
-- 8) select bookid, price * 2 from mybook;
-- 설명: price에 2를 곱한 값을 조회합니다. price가 null인 경우, null이 반환됩니다.
select bookid, price * 2 from mybook;
--2	40000
--1	20000
--3 0	
-- 3번
-- (1) 모든 데이터를 선택
select * from book;

-- (2) 상위 5개 데이터를 선택 (정렬 없이)
select * from book where rownum <= 5;

-- (3) 상위 5개 데이터를 가격 순으로 정렬하여 선택
select * from (
    select * from book order by price
) where rownum <= 5;

-- (4) 가격 순으로 정렬된 후 상위 5개 데이터를 선택
select * from (
    select * from book order by price
) b where rownum <= 5;

-- (5) 상위 5개 데이터를 먼저 선택 후 가격 순으로 정렬
select * from (
    select * from book where rownum <= 5
) b order by price;

-- (6) 상위 5개 데이터를 가격 순으로 정렬하여 선택
select * from (
    select * from book where rownum <= 5 order by price
) b;

-- 문제 1: sql where 문장 내의 비교조건 해석

-- (1) "21 not in (select 과일코드 from 과일)"은 참이다.
-- (2) "19 < any (select 과일코드 from 과일)"은 거짓이다.
-- (3) "15 < all (select 과일코드 from 과일)"은 참이다.
-- (4) "19 = all (select 과일코드 from 과일)"은 거짓이다.
-- 참인 문장: 2개 (조건 1, 3)
-- 거짓인 문장: 2개 (조건 2, 4)


-- 문제 2: 부속질의 

-- (1) sql 문
select custid,
       (select address
        from customer cs
        where cs.custid = od.custid) "address",
       sum(saleprice) "total"
from orders od
group by od.custid;
-- 설명:각 고객의 주문 금액 합계와 그 고객의 주소를 가져옵니다.
--(2) sql 문
select cs.name, s
from (select custid, avg(saleprice) s
      from orders
      group by custid) od,
     customer cs
where cs.custid = od.custid;
-- 설명:각 고객의 주문 평균 금액과 그 고객의 이름을 가져옵니다.
-- (3) sql 문
select *
from orders od
where exists (
    select *
    from customer cs
    where cs.custid <= 3 and cs.custid = od.custid
);
-- 설명:고객 테이블에 custid가 3 이하인 고객이 있는 주문만 가져옵니다.

-- 판매가격이 20000원 이상인 도서의 도서번호, 도서이름, 고객이름, 출판사, 판매가격을 보여주는 view 생성
create view highorders (bookid, bookname, name, publisher, saleprice)
as 
select b.bookid, 
       b.bookname, 
       c.name, 
       b.publisher, 
       o.saleprice 
from book b
join orderdetails o on b.bookid = o.bookid
join customer c on o.custid = c.custid
where o.saleprice >= 20000;


-- 판매된 도서의 이름과 고객의 이름을 출력
select bookname, name 
from highorders;


