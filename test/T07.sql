-- 1. artist 테이블 생성
CREATE TABLE artist (
    artist_id   VARCHAR2(20) NOT NULL,
    name        VARCHAR2(40),
    nationality VARCHAR2(40),
    dob         DATE
);

-- Primary Key 제약 조건 추가
ALTER TABLE artist ADD CONSTRAINT artist_pk PRIMARY KEY (artist_id);

-- 2. cd 테이블 생성
CREATE TABLE cd (
    cd_id     NUMBER NOT NULL,
    title     VARCHAR2(40),
    price     NUMBER,
    genre     VARCHAR2(40),
    artist_id VARCHAR2(20) NOT NULL
);

-- Primary Key 제약 조건 추가
ALTER TABLE cd ADD CONSTRAINT cd_pk PRIMARY KEY (cd_id);

-- 외래 키 제약 조건 추가
ALTER TABLE cd
    ADD CONSTRAINT cd_artist_fk FOREIGN KEY (artist_id)
        REFERENCES artist(artist_id);

-- 3. trek 테이블 생성
CREATE TABLE trek (
    title        VARCHAR2(40),
    running_time NUMBER,
    cd_id        NUMBER NOT NULL
);

-- 외래 키 제약 조건 추가
ALTER TABLE trek
    ADD CONSTRAINT trek_cd_fk FOREIGN KEY (cd_id)
        REFERENCES cd(cd_id);
        
-- 4. 테이블에 데이터 삽입 (한국 아티스트와 CD)

-- artist 데이터 삽입 (한국 아티스트들)
INSERT INTO artist VALUES ('1', '아이유', '대한민국', TO_DATE('1993-05-16', 'YYYY-MM-DD'));
INSERT INTO artist VALUES ('2', '방탄소년단', '대한민국', TO_DATE('2013-06-13', 'YYYY-MM-DD'));
INSERT INTO artist VALUES ('3', 'BLACKPINK', '대한민국', TO_DATE('2016-08-08', 'YYYY-MM-DD'));

-- cd 데이터 삽입 (한국 아티스트들의 CD)
INSERT INTO cd VALUES (1, '팔레트', 15000, '발라드', '1');  -- 아이유 - 팔레트
INSERT INTO cd VALUES (2, 'LOVE YOURSELF: Her', 18000, '팝', '2');  -- 방탄소년단 - LOVE YOURSELF: Her
INSERT INTO cd VALUES (3, 'THE ALBUM', 22000, 'K-팝', '3');  -- BLACKPINK - THE ALBUM
INSERT INTO cd VALUES (4, '꽃갈피', 13000, '발라드', '1');  -- 아이유 - 꽃갈피
INSERT INTO cd VALUES (5, 'LOVE YOURSELF: Tear', 17000, '팝', '2');  -- 방탄소년단 - LOVE YOURSELF: Tear
INSERT INTO cd VALUES (6, 'SQUARE UP', 20000, 'K-팝', '3');  -- BLACKPINK - SQUARE UP

-- trek 데이터 삽입 (각 CD의 트랙)
INSERT INTO trek VALUES ('팔레트', 295, 1);  -- 아이유 - 팔레트
INSERT INTO trek VALUES ('그 사람', 245, 1);  -- 아이유 - 그 사람
INSERT INTO trek VALUES ('DNA', 230, 2);  -- 방탄소년단 - DNA
INSERT INTO trek VALUES ('Mic Drop', 250, 2);  -- 방탄소년단 - Mic Drop
INSERT INTO trek VALUES ('How You Like That', 280, 3);  -- BLACKPINK - How You Like That
INSERT INTO trek VALUES ('Lovesick Girls', 305, 3);  -- BLACKPINK - Lovesick Girls
INSERT INTO trek VALUES ('밤편지', 310, 4);  -- 아이유 - 밤편지
INSERT INTO trek VALUES ('피 땀 눈물', 270, 5);  -- 방탄소년단 - 피 땀 눈물
INSERT INTO trek VALUES ('DDU-DU DDU-DU', 320, 6);  -- BLACKPINK - DDU-DU DDU-DU
