CREATE TABLE MONITORING
(
    id NUMBER(10) PRIMARY KEY,
    old_file_name VARCHAR2(100),
    file_name VARCHAR2(100) NOT NULL,
    old_file_path VARCHAR (100),
    file_path VARCHAR (100) NOT NULL,
    operation VARCHAR2(100) NOT NULL,
    change_date DATE NOT NULL
);

CREATE SEQUENCE seq_monitoring
MINVALUE 1
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE OR REPLACE TRIGGER tr_monitoring BEFORE INSERT ON MONITORING FOR EACH ROW
BEGIN SELECT seq_monitoring.NEXTVAL INTO :NEW.id FROM DUAL; END;
/

DELETE MONITORING;
DROP TABLE MONITORING;
DROP SEQUENCE seq_monitoring;
DROP TRIGGER tr_monitoring;

select * from MONITORING;
select * from single_scans;

select FILE_NAME FROM MONITORING;


CREATE TABLE SINGLE_SCANS
(
    id NUMBER(10) PRIMARY KEY,
    file_name VARCHAR2(100) NOT NULL,
    file_extension VARCHAR2(100),
    file_path VARCHAR2(100) NOT NULL,
    last_access DATE NOT NULL,
    last_write DATE NOT NULL,
    creation_date DATE NOT NULL
);

CREATE SEQUENCE seq_scans
MINVALUE 1
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE OR REPLACE TRIGGER tr_scans BEFORE INSERT ON SINGLE_SCANS FOR EACH ROW
BEGIN SELECT seq_scans.NEXTVAL INTO :NEW.id FROM DUAL; END;
/

DROP TABLE SINGLE_SCANS;
DROP SEQUENCE seq_scans;
DROP TRIGGER tr_scans;