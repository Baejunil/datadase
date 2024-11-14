-- 축구선수 맞추기 게임 후아유 게임 데이터베이스 만들어보기
-- 선수 테이블
create table players (
    player_id int primary key,          -- 선수 고유 id
    player_name varchar2(100) not null,  -- 선수 이름
    nationality varchar2(50),            -- 선수 국가
    position varchar2(50),               -- 선수 포지션 (예: 공격수, 수비수 등)
    team_name varchar2(100),        -- 소속 팀 이름
     birth_year number(4);          --출생년도
);

-- 힌트 테이블
create table hints (
    hint_id int primary key,            -- 힌트 고유 id
    player_id int,                      -- 해당 힌트가 연결된 선수 id (외래키)
    hint_text clob,                     -- 힌트 내용
    hint_type varchar2(50),              -- 힌트 종류 
    foreign key (player_id) references players(player_id)
);

-- 사용자 테이블
create table users (
    user_id int primary key,            -- 사용자 고유 id
    username varchar2(50) not null,       -- 사용자 이름
    total_score int default 0           -- 사용자 총 점수
);

-- 게임 라운드 테이블
create table game_rounds (
    round_id int primary key,             -- 라운드 고유 id
    user_id int,                          -- 사용자 id (게임을 플레이한 사용자)
    player_id int,                        -- 맞춰야 할 선수 (외래키)
    hint_provided clob,                   -- 제공된 힌트 (긴 텍스트 데이터)
    is_answered_correctly number(1),      -- 정답 여부 (0 또는 1로 저장)
    user_score int,                       -- 사용자 점수 (정답 시 점수 추가)
    round_number int,                     -- 라운드 번호
    foreign key (user_id) references users(user_id),  -- 외래키: users 테이블
    foreign key (player_id) references players(player_id)  -- 외래키: players 테이블
);

--선수 정보 삽입 (players 테이블
-- 선수 데이터 삽입 (players 테이블, 출생 연도 추가)
insert into players (player_id, player_name, nationality, position, team_name, birth_year)
values (1, '이강인', '대한민국', '미드필더', '파리 생제르맹', 2001);
insert into players (player_id, player_name, nationality, position, team_name, birth_year)
values (2, '손흥민', '대한민국', '포워드', '토트넘 핫스퍼', 1992);
insert into players (player_id, player_name, nationality, position, team_name, birth_year)
values (3, '김민재', '대한민국', '디펜더', '바이에른 뮌헨', 1996);
insert into players (player_id, player_name, nationality, position, team_name, birth_year)
values (4, '황인범', '대한민국', '미드필더', '페예노르트', 1996);
insert into players (player_id, player_name, nationality, position, team_name, birth_year)
values (5, '이재성', '대한민국', '미드필더', '마인츠05', 1992);
insert into players (player_id, player_name, nationality, position, team_name, birth_year)
values (6, '배준호', '대한민국', '미드필더', '스토크시티', 2003);
insert into players (player_id, player_name, nationality, position, team_name, birth_year)
values (7, '설영우', '대한민국', '디펜더', '즈베다즈베즈', 1998);
insert into players (player_id, player_name, nationality, position, team_name, birth_year)
values (8, '백승호', '대한민국', '미드필더', '버밍엄시티', 1997);
insert into players (player_id, player_name, nationality, position, team_name, birth_year)
values (9, '김지수', '대한민국', '디펜더', '브렌트포드', 2004);
insert into players (player_id, player_name, nationality, position, team_name, birth_year)
values (10, '김민수', '대한민국', '미드필더', '지로나FC', 2006);
insert into players (player_id, player_name, nationality, position, team_name, birth_year)
values (11, '홍현석', '대한민국', '미드필더', '마인츠05', 1999);

--힌트 정보 삽입 (hints 테이블에 데이터 추가)
insert into hints (hint_id, player_id, hint_text, hint_type)
values (1, 1, '이 선수는 발렌시아 유스출신에 마요르카도 뛰었습니다', ' 팀');
insert into hints (hint_id, player_id, hint_text, hint_type)
values (2, 2, '이 선수 레버쿠젠과 함부르크 그후 팀에서 오랫동안 뛰고 현재는 주장입니다.', '팀');
insert into hints (hint_id, player_id, hint_text, hint_type)
values (3, 3, '이 선수는 전북현대와 중국리그 터키리그이후 리그앙1 현재는 분데스리가입니다.', '팀');
insert into hints (hint_id, player_id, hint_text, hint_type)
values (4, 4, '이 선수는 올림피아코스팀을 거쳐 현재는 에레디비시에 있습니다', '팀');
insert into hints (hint_id, player_id, hint_text, hint_type)
values (5, 5, '이 선수는 현재 전북현대를 거쳐 분데스리가에 있습니다.', '팀');
insert into hints (hint_id, player_id, hint_text, hint_type)
values (6, 6, '대전시티즌을 걸쳐 스토크시티에서 코리안킹이라고 불린다.', '팀');
insert into hints (hint_id, player_id, hint_text, hint_type)
values (7, 7, '축구경기를 볼때 무섭다고 느껴질만큼 열정적인 서포터즈를 가진팀에 속해 있으면 울산현대출신이다.', '팀');
insert into hints (hint_id, player_id, hint_text, hint_type)
values (8, 8, '바르셀로나 에서 쿠쿠렐라와 함께 유스로 활약했던선수 그러나 징계를받고 전북현대를 거쳐 현재는 버밍엄시티에서 활약중이다.', '팀');
insert into hints (hint_id, player_id, hint_text, hint_type)
values (9, 9, '김민재이후 월클 센터백이라면 이선수일것이다라는 평가를 받는선수.', '팀');
insert into hints (hint_id, player_id, hint_text, hint_type)
values (10, 10, '현재유일한 한국인 라리가선수이다.', '팀');
insert into hints (hint_id, player_id, hint_text, hint_type)
values (11, 11, '이선수는 울산현대 출신에 현재는 분데스리가에 뛰고있습니다.', '팀');

-- 선수 출력
select * from players;

-- 힌트 
select * from hints;
-- 게임에 새로운 사용자 등록 유저
insert into users (user_id, username, total_score)
values (1, 'user1', 0);

--  사용자 점수 업데이트
update users
set total_score = total_score + 10
where user_id = 1;

-- 사용자의 게임 진행기록
select * from game_rounds
where user_id = 1;

-- 한명의 선수의 힌트 모두 공개
select hint_text from hints
where player_id = 1;

-- 게임 라운드에서 제공된 힌트 조회
select hint_provided from game_rounds
where round_id = 1;

-- 게임에서 제공된 첫 번째 힌트
select hint_text
from hints
where player_id = 1
order by hint_id
fetch first 1 rows only;

-- 모든 사용자 이름과 총점 조회
select username, total_score
from users;

-- 국가의 선수들 조회
select * from players
where nationality = '대한민국';

-- 라운드의 정답 여부와 점수 조회
select is_answered_correctly, user_score
from game_rounds
where round_id = 3;

-- 가장 높은 점수를 가진 사용자 조회
select username, total_score
from users
order by total_score desc
fetch first 1 rows only;

-- 특정 팀의 선수 목록 조회
select player_name, team_name
from players
where team_name = '토트넘 핫스퍼';

-- 점수가 높은순으로 라운드 정보조회
select round_id, user_score
from game_rounds
order by user_score desc;

-- 점수 일정이상 조회
select username, total_score
from users
where total_score > 5;

-- 사용자의 라운드 번호와 정답여부조회
select round_number, is_answered_correctly
from game_rounds
where user_id = 2;

-- 선수 이름과 출생 연도 조회
select player_name, birth_year
from players
where player_id = 1;

-- 라운드의 점수총합조회
select sum(user_score)
from game_rounds
where is_answered_correctly = 1;

-- 라운드의 점수 업데이트
update game_rounds
set user_score = 10
where round_id = 5;

-- 사용자의 게임기록삭제
delete from game_rounds
where user_id = 1;

-- 선수 팀변경
update players
set team_name = '맨체스터 유나이티드'
where player_id = 10;

--라운드 정보조회
select hint_provided from (
    select hint_provided
    from game_rounds
    where player_id = 1
    order by round_id
)
where rownum = 1;

-- 선수들의 출생 연도별 선수 수조히
select birth_year, count(*) as num_players
from players
group by birth_year
order by birth_year;
