-- 다음함수를 한번씩 사용하고 어떤함수인지 설명하기
--1. **ABS(-15)** | 절댓값을 반환 | `ABS(-15) = 15`
--2. **CEIL(15)** | 숫자를 올림하여 정수로 반환 | `CEIL(15) = 15`
--3. **COS(3.14159)** | 주어진 라디안 값에 대한 코사인 반환 | `COS(3.14159) = -1`
--4. **FLOOR(15)** | 숫자를 내림하여 정수로 반환 | `FLOOR(15) = 15`
--5. **LOG(10,100)** | 주어진 진법에 대한 로그 값을 반환 | `LOG(10, 100) = 2`
--6. **MOD(11,4)** | 두 숫자의 나머지 반환 | `MOD(11, 4) = 3`
--7. **POWER(3,2)** | 거듭제곱 값 반환 | `POWER(3, 2) = 9`
--8. **ROUND(15,7)** | 숫자를 주어진 자릿수로 반올림 | `ROUND(15, 7) = 15`
--9. **SIGN(-15)** | 숫자의 부호 반환 (-1은 음수, 1은 양수) | `SIGN(-15) = -1`
--10. **TRUNC(15,7)** | 숫자를 주어진 자릿수로 잘라냄 | `TRUNC(15, 7) = 15`
--11. **CHR(67)** | ASCII 값을 문자로 변환 | `CHR(67) = 'C'`
--12. **CONCAT('HAPPY', 'Birthday')** | 두 문자열을 이어붙임 | `CONCAT('HAPPY', 'Birthday') = 'HAPPYBirthday'`
--13. **LOWER('Birthday')** | 문자열을 소문자로 변환 | `LOWER('Birthday') = 'birthday'`
--14. **LPAD('Page 1', 15, '*')** | 문자열의 왼쪽을 지정된 문자로 채워서 길이 맞추기 | `LPAD('Page 1', 15, '*') = '******Page 1'`
--15. **LTRIM('Page 1', 'ae')** | 문자열의 왼쪽에서 지정된 문자들을 제거 | `LTRIM('Page 1', 'ae') = 'Pg 1'`
--16. **REPLACE('JACK', 'J', 'BL')** | 문자열 내의 특정 문자를 다른 문자로 대체 | `REPLACE('JACK', 'J', 'BL') = 'BLACK'`
---17. **RPAD('Page 1', 15, ' ')** | 문자열의 오른쪽을 지정된 문자로 채워서 길이 맞추기 | `RPAD('Page 1', 15, ' ') = 'Page 1        '`
--18. **RTRIM('Page 1', 'ae')** | 문자열의 오른쪽에서 지정된 문자들을 제거 | `RTRIM('Page 1', 'ae') = 'Page 1'`
--19. **SUBSTR('ABCDEFG', 3, 4)** | 문자열의 일부분을 추출 | `SUBSTR('ABCDEFG', 3, 4) = 'CDEF'`
--20. **TRIM(LEADING 0 FROM '00AA00')** | 문자열의 앞부분에서 지정된 문자를 제거 | `TRIM(LEADING '0' FROM '00AA00') = 'AA00'`
--21. **UPPER('Birthday')** | 문자열을 대문자로 변환 | `UPPER('Birthday') = 'BIRTHDAY'`
--22. **INSTR('CORPORATE FLOOR', 'OR', 3, 2)** | 문자열에서 특정 패턴의 위치 반환 | `INSTR('CORPORATE FLOOR', 'OR', 3, 2) = 10`
--23. **ASCII('A')** | 문자에 해당하는 ASCII 값 반환 | `ASCII('A') = 65`
--24. **LENGTH('Birthday')** | 문자열의 길이 반환 | `LENGTH('Birthday') = 8`
--25. **ADD_MONTHS('14/05/21', 1)** | 날짜에 월 수를 더함 | `ADD_MONTHS('14/05/21', 1) = '14/06/21'`
--26. **LAST_DAY(SYSDATE)** | 주어진 날짜의 월의 마지막 날 반환 | `LAST_DAY(SYSDATE) = '2024-11-30'` (실제 SYSDATE 값에 따라 다름)
--27. **NEXT_DAY(SYSDATE, '화')** | 주어진 날짜 이후 가장 가까운 지정된 요일 반환 | `NEXT_DAY(SYSDATE, '화') = '2024-11-12'` (실제 SYSDATE 값에 따라 다름)
--28. **ROUND(SYSDATE)** | 날짜를 반올림하여 가장 가까운 날짜로 반환 | `ROUND(SYSDATE) = '2024-11-07'` (실제 SYSDATE 값에 따라 다름)
--29. **SYSDATE** | 현재 시스템 날짜 및 시간 반환 | `SYSDATE = '2024-11-07 13:45:00'`
--30. **TO_CHAR(SYSDATE)** | 날짜를 문자열 형식으로 변환 | `TO_CHAR(SYSDATE) = '2024-11-07'`
--31. **TO_CHAR(123)** | 숫자를 문자열로 변환 | `TO_CHAR(123) = '123'`
--32. **TO_DATE('12 05 2020', 'DD MM YYYY')** | 문자열을 날짜 형식으로 변환 | `TO_DATE('12 05 2020', 'DD MM YYYY') = '2020-05-12'`

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

-- (2) select bookid, nvl(price, 0) from mybook;
-- 설명: price가 null인 경우, 0으로 대체하여 조회합니다.
select bookid, nvl(price, 0) from mybook;

-- (3) select * from mybook where price is null;
-- 설명: price가 null인 행만 조회합니다.
select * from mybook where price is null;

-- (4) select * from mybook where price = '';
-- 설명: price가 빈 문자열('')인 행을 조회한다
-- 아무것도 안나온다 
select * from mybook where price = '';

-- (5) select bookid, price + 100 from mybook;
-- 설명: price에 100을 더한 값을 조회합니다.
-- price가 null인 경우, null이 반환됩니다.
select bookid, price + 100 from mybook;

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
