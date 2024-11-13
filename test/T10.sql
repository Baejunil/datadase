
-- 1. 엔터티 및 관계

-- 1.1 의사 (Doctor)
-- : 의사 ID, 성명, 성별, 연락처, 이메일, 직급, 담당 진료 과목
--  doctor_id ,name, gender, phone, email, title, specialty
-- 기본키**: 의사 ID

-- 1.2 환자 (Patient)
-- **속성**: 환자 ID, 성명, 주민번호, 성별, 주소, 연락처, 이메일, 담당 의사 ID
-- patient_id, name,ssn,gender,add,phone,email
-- **기본키**: 환자 ID
-- **외래키**: 담당 의사 ID (Doctor)

-- 1.3 간호사 (Nurse)
-- 속성: 간호사 ID, 성명, 성별, 전화번호, 이메일, 직급, 담당 업무
-- nurse_id, name, gender, phon, email, title, duties
--- 기본키**: 간호사 ID

-- 1.4 진료 (Treatment)
-- **속성**: 진료 ID, 진료 날짜, 진료 순번, 환자 ID, 의사 ID, 진료 내용
-- treatment_id,treatment_data, treatment_order, treatment_details
-- **기본키**: 진료 ID
-- **외래키**: 환자 ID (Patient), 의사 ID (Doctor)

--#### 1.5 차트 (Chart)
-- **속성**: 차트 ID, 진료 ID, 의사 ID, 간호사 ID, 진료 내용, 의사 소견
-- **기본키**: 차트 ID
-- chart_details, doctor_comments
-- **외래키**: 진료 ID (Treatment), 의사 ID (Doctor), 간호사 ID (Nurse)
--차트 테이블 만들기
CREATE TABLE "Chart(차트)" (
    chart_id                      NUMBER NOT NULL,
    chart_details                 VARCHAR2(1000),
    doctor_comments               VARCHAR2(1000),
    "Doctor(의사)_doctor_id"        NUMBER NOT NULL,
    "Nurse(간호사)_nurse_id"         NUMBER NOT NULL,
    "Treatment(진료)_treatment_id " NUMBER NOT NULL
);

ALTER TABLE "Chart(차트)" ADD CONSTRAINT "Chart(차트)_PK" PRIMARY KEY ( chart_id );

ALTER TABLE "Chart(차트)"
    ADD CONSTRAINT "Chart(차트)_Doctor(의사)_FK" FOREIGN KEY ( "Doctor(의사)_doctor_id" )
        REFERENCES "Doctor(의사)" ( doctor_id );

ALTER TABLE "Chart(차트)"
    ADD CONSTRAINT "Chart(차트)_Nurse(간호사)_FK" FOREIGN KEY ( "Nurse(간호사)_nurse_id" )
        REFERENCES "Nurse(간호사)" ( nurse_id );

ALTER TABLE "Chart(차트)"
    ADD CONSTRAINT "Chart(차트)_Treatment(진료)_FK" FOREIGN KEY ( "Treatment(진료)_treatment_id " )
        REFERENCES "Treatment(진료)" ( "treatment_id " );
-- 의사 테이블
CREATE TABLE "Doctor(의사)" (
    doctor_id NUMBER NOT NULL,
    name      VARCHAR2(100),
    gender    VARCHAR2(100),
    phone     VARCHAR2(100),
    email     VARCHAR2(100),
    title     VARCHAR2(100),
    specialty VARCHAR2(100)
);

ALTER TABLE "Doctor(의사)" ADD CONSTRAINT "Doctor(의사)_PK" PRIMARY KEY ( doctor_id );
--간호사 테이블
CREATE TABLE "Nurse(간호사)" (
    nurse_id NUMBER NOT NULL,
    name     VARCHAR2(100),
    phone    VARCHAR2(100),
    email    VARCHAR2(100),
    title    VARCHAR2(100),
    duties   VARCHAR2(200)
);

ALTER TABLE "Nurse(간호사)" ADD CONSTRAINT "Nurse(간호사)_PK" PRIMARY KEY ( nurse_id );
-- 환자 테이블
CREATE TABLE "Patient(환자)" (
    patient_id             NUMBER NOT NULL,
    ssn                    VARCHAR2(100),
    gender                 VARCHAR2(100) 
--  ERROR: VARCHAR2 size not specified 
    ,
    "add"                  VARCHAR2(100) 
--  ERROR: VARCHAR2 size not specified 
    ,
    phone                  VARCHAR2(100) 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    email                  VARCHAR2(100),
    "Doctor(의사)_doctor_id" NUMBER NOT NULL
);

ALTER TABLE "Patient(환자)" ADD CONSTRAINT "Patient(환자)_PK" PRIMARY KEY ( patient_id );

ALTER TABLE "Patient(환자)"
    ADD CONSTRAINT "Patient(환자)_Doctor(의사)_FK" FOREIGN KEY ( "Doctor(의사)_doctor_id" )
        REFERENCES "Doctor(의사)" ( doctor_id );
-- 진료 테이블        
CREATE TABLE "Treatment(진료)" (
    "treatment_id "          NUMBER NOT NULL,
    treatment_date           DATE,
    "treatment_order "       NUMBER,
    treatment_details4       NVARCHAR2(500),
    "Patient(환자)_patient_id" NUMBER NOT NULL,
    "Doctor(의사)_doctor_id"   NUMBER NOT NULL
);

ALTER TABLE "Treatment(진료)" ADD CONSTRAINT "Treatment(진료)_PK" PRIMARY KEY ( "treatment_id " );

ALTER TABLE "Treatment(진료)"
    ADD CONSTRAINT "Treatment(진료)_Doctor(의사)_FK" FOREIGN KEY ( "Doctor(의사)_doctor_id" )
        REFERENCES "Doctor(의사)" ( doctor_id );

ALTER TABLE "Treatment(진료)"
    ADD CONSTRAINT "Treatment(진료)_Patient(환자)_FK" FOREIGN KEY ( "Patient(환자)_patient_id" )
        REFERENCES "Patient(환자)" ( patient_id );
        
