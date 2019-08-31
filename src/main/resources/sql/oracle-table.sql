------------------------------------
---表名：DEMO_DEPARTMENT（部门信息）
------------------------------------
--表结构
CREATE TABLE DEMO_DEPARTMENT
(
	ID         		  NUMBER NOT NULL,
	PARENT_ID       NUMBER NOT NULL,
	NAME       		  VARCHAR2(10),
	DELETED         INT NOT NULL,
	CREATE_TIME     TIMESTAMP,
	PRIMARY KEY (ID)
);
--表注释
COMMENT ON TABLE DEMO_DEPARTMENT IS '部门信息';
COMMENT ON COLUMN DEMO_DEPARTMENT.ID IS '部门编号';
COMMENT ON COLUMN DEMO_DEPARTMENT.AGE IS '父级编号';
COMMENT ON COLUMN DEMO_DEPARTMENT.NAME IS '部门名称';
COMMENT ON COLUMN DEMO_DEPARTMENT.DELETED IS '是否已删除（0：未删除；1：已删除）';
COMMENT ON COLUMN DEMO_DEPARTMENT.CREATE_TIME IS '创建时间';
--序列
CREATE SEQUENCE S_DEPARTMENT_ID
MINVALUE 1
NOMAXVALUE
INCREMENT BY 1
START WITH 1
NOCACHE;
--触发器
CREATE OR REPLACE TRIGGER TG_DEPARTMENT_ID
BEFORE INSERT ON DEMO_PERSON FOR EACH ROW WHEN (NEW.ID IS NULL)
BEGIN
  SELECT S_DEPARTMENT_ID.NEXTVAL INTO:NEW.ID FROM DUAL;
END;
/


------------------------------------
---表名：DEMO_PERSON（人员信息）
------------------------------------
--表结构
CREATE TABLE DEMO_PERSON
(
	ID         		  NUMBER NOT NULL,
	NAME       		  VARCHAR2(10),
	ACCOUNT         VARCHAR2(10) NOT NULL,
	PASSDORD        VARCHAR2(20) NOT NULL,
	DEPARTMENT_ID 	NUMBER,
	AGE        		  NUMBER,
	SEX        		  VARCHAR2(1),
	TEL        		  VARCHAR2(20),
	EMAIL        		VARCHAR2(35),
	ADDRESS    		  VARCHAR2(20),
	DELETED         INT NOT NULL,
	CREATE_TIME     TIMESTAMP,
	PRIMARY KEY (ID)
);
--表注释
COMMENT ON TABLE DEMO_PERSON IS '人员信息';
COMMENT ON COLUMN DEMO_PERSON.ID IS '人员编号';
COMMENT ON COLUMN DEMO_PERSON.NAME IS '姓名';
COMMENT ON COLUMN DEMO_PERSON.USER_NAME IS '账号';
COMMENT ON COLUMN DEMO_PERSON.PASSDORD IS '密码';
COMMENT ON COLUMN DEMO_PERSON.DEPARTMENT_ID IS '部门编号';
COMMENT ON COLUMN DEMO_PERSON.AGE IS '年龄';
COMMENT ON COLUMN DEMO_PERSON.SEX IS '性别（0：女，1：男）';
COMMENT ON COLUMN DEMO_PERSON.TEL IS '电话';
COMMENT ON COLUMN DEMO_PERSON.EMAIL IS '邮箱';
COMMENT ON COLUMN DEMO_PERSON.ADDRESS IS '地址';
COMMENT ON COLUMN DEMO_PERSON.DELETED IS '是否已删除（0：未删除；1：已删除）';
COMMENT ON COLUMN DEMO_PERSON.CREATE_TIME IS '创建时间';
--序列
CREATE SEQUENCE S_PERSON_ID
MINVALUE 1
NOMAXVALUE
INCREMENT BY 1
START WITH 1
NOCACHE;
--触发器
CREATE OR REPLACE TRIGGER TG_PERSON_ID
BEFORE INSERT ON DEMO_PERSON FOR EACH ROW WHEN (NEW.ID IS NULL)
BEGIN
  SELECT S_PERSON_ID.NEXTVAL INTO:NEW.ID FROM DUAL;
END;
/


