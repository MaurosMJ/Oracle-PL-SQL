--@Author: MaurosMJ

CREATE TABLE job_profiles (
    profile_id      NUMBER,
    first_name      VARCHAR2(200),
    last_name       VARCHAR2(200),
    profile_picture BLOB
);
--Criando uma sequence para job_profiles
CREATE SEQUENCE job_profiles_seq START WITH 1 INCREMENT BY 1 NOCACHE NOMAXVALUE NOCYCLE;