--c03-05

--데이터 정의어
-- 데이터를 저장하려면 먼저 데이터를 저장할 테이블의 구조를 만들어야함
-- sql의 데이터 정의어는 바로 이구조를 만드는 명령잉다
-- 데이터 정의어는 테이블의 구조를 만드는 create문 구조를 변경하는 alter문
-- 구조를 삭제하는 drop문이 있다

--1. create문
--create 문은 테이블을 구성하고 속성과 속서에 관한 제약을 정의하며
--기본키 및 외래키를 정의하는 명령이다.

--create 문의 문법
-- create table 테이블 이름(
-- {속성이름 테이터타입 [null|not null|unique|defauit 기본값|check체크조건]}
--[primary key 속성이름 들]
--[foreign key 속성이름 references 테이블 이름 속성이름]
--  [on delete {cascade|set null}]
--)
--문법에 {}안의 내용은 반복가능 [] 선택적으로 사용 | 한개를 선택
-- not null : null값을 허용하지 않는 제약
-- unique : 유일한 값에 대한 제약
-- default: 기본값 설정
--check : 값데 대한 조건을 부여할 때 사용
-- primary key: 기본키
-- foreign key : 외래키를 지정
-- on delete: 투플의 삭제시 외래키 속성에대한 동작을 나타낸다
--on delete 옵션으로 cascade set null 이있다
--on delete 를 명시 하지 않으면 restricr (no action) 이다