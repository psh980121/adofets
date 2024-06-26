
/* Drop Tables */

DROP TABLE ADOPT CASCADE CONSTRAINTS;
DROP TABLE FAVORITES CASCADE CONSTRAINTS;
DROP TABLE ANIMAL CASCADE CONSTRAINTS;
DROP TABLE BUY CASCADE CONSTRAINTS;
DROP TABLE COMMENT CASCADE CONSTRAINTS;
DROP TABLE POST CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE QUESTION CASCADE CONSTRAINTS;
DROP TABLE SHELTER CASCADE CONSTRAINTS;
DROP TABLE USER CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE ADOPT
(
	ADOPTIDX number NOT NULL,
	ANINO number NOT NULL,
	USERID varchar2(30) NOT NULL,
	ADOPTDATE date NOT NULL,
	ANIADOPT varchar2(15) NOT NULL,
	PRIMARY KEY (ADOPTIDX)
);


CREATE TABLE ANIMAL
(
	ANINO number NOT NULL UNIQUE,
	ANISPE varchar2(15) NOT NULL,
	ANIBREEDS varchar2(20) NOT NULL,
	ANIAGE varchar2(20) NOT NULL,
	ANIWEIGHT number NOT NULL,
	ANINEU varchar2(5) NOT NULL,
	ANIGENDER varchar2(30) NOT NULL,
	ANISHEL varchar2(30) NOT NULL,
	ANIADOPT varchar2(15) NOT NULL,
	ANIFILE varchar2(500) NOT NULL,
	ANISPECIAL varchar2(500) NOT NULL,
	PRIMARY KEY (ANINO)
);


CREATE TABLE BUY
(
	BUYIDX number NOT NULL,
	PDTCODE number NOT NULL,
	USERID varchar2(30) NOT NULL,
	BUYCNT number NOT NULL,
	PRIMARY KEY (BUYIDX)
);


CREATE TABLE COMMENT
(
	COMMENTIDX number NOT NULL,
	POSTIDX varchar2(30) NOT NULL,
	COMMENTID varchar2(30) NOT NULL,
	COMMENTNICK varchar2(40) NOT NULL,
	COMMENTCONTENT varchar2(1000) NOT NULL,
	COMMENTDATE date NOT NULL,
	COMMENTLIKE number NOT NULL,
	PRIMARY KEY (COMMENTIDX)
);


CREATE TABLE FAVORITES
(
	FAVIDX number NOT NULL,
	USERID varchar2(30) NOT NULL,
	ANIID number,
	PRIMARY KEY (FAVIDX)
);


CREATE TABLE POST
(
	POSTIDX varchar2(30) NOT NULL,
	USERNICK varchar2(40) NOT NULL,
	POSTCONTENT varchar2(1000) NOT NULL,
	POSTTIME date NOT NULL,
	LIKECNT number NOT NULL,
	VIEWCNT number NOT NULL,
	POSTCATE varchar2(30) NOT NULL,
	POSTITLE varchar2(40) NOT NULL,
	COMMENTCNT number NOT NULL,
	PRIMARY KEY (POSTIDX)
);


CREATE TABLE PRODUCT
(
	PDTCODE number NOT NULL,
	PDTCATE varchar2(30) NOT NULL,
	PDTPRICE number NOT NULL,
	PDTCONTENT varchar2(1000) NOT NULL,
	PDTNAME varchar2(50) NOT NULL,
	USERNICK varchar2(40) NOT NULL,
	USERID varchar2(30) NOT NULL,
	PDTTYPE varchar2(100) NOT NULL,
	PDTDATE date NOT NULL,
	PRIMARY KEY (PDTCODE)
);


CREATE TABLE QUESTION
(
	QSID varchar2(30) NOT NULL,
	QSCATEGORY varchar2(500) NOT NULL,
	QSTITLE varchar2(100) NOT NULL,
	USERID varchar2(30) NOT NULL,
	QSDATE date NOT NULL,
	QSPROCESS varchar2(100) NOT NULL,
	ASDATE date,
	ASCONTENT varchar2(1000),
	QSCONTENT varchar2(1000) NOT NULL,
	PRIMARY KEY (QSID)
);


CREATE TABLE SHELTER
(
	SHELTERID varchar2(30) NOT NULL,
	SHELTERCITY varchar2(30) NOT NULL,
	SHELTERNAME varchar2(30) NOT NULL,
	SHELTERMAX number NOT NULL,
	SHELTEREM number NOT NULL,
	SHELTERCONTENT varchar2(500) NOT NULL,
	SHELTERTEL varchar2(15) NOT NULL,
	PRIMARY KEY (SHELTERID)
);


CREATE TABLE USER
(
	USERID varchar2(30) NOT NULL,
	USERCATE varchar2(15) NOT NULL,
	USERPASS varchar2(40) NOT NULL,
	USERNAME varchar2(20) NOT NULL,
	USERNICK varchar2(40) NOT NULL UNIQUE,
	USERAGE number NOT NULL,
	USERCITY varchar2(30) NOT NULL,
	USEREMAIL varchar2(50) NOT NULL,
	USERPHONE varchar2(15) NOT NULL,
	USERDATE date NOT NULL,
	PRIMARY KEY (USERID)
);



/* Create Foreign Keys */

ALTER TABLE ADOPT
	ADD FOREIGN KEY (ANINO)
	REFERENCES ANIMAL (ANINO)
;


ALTER TABLE FAVORITES
	ADD FOREIGN KEY (ANIID)
	REFERENCES ANIMAL (ANINO)
;


ALTER TABLE COMMENT
	ADD FOREIGN KEY (POSTIDX)
	REFERENCES POST (POSTIDX)
;


ALTER TABLE BUY
	ADD FOREIGN KEY (PDTCODE)
	REFERENCES PRODUCT (PDTCODE)
;


ALTER TABLE ANIMAL
	ADD FOREIGN KEY (ANISHEL)
	REFERENCES SHELTER (SHELTERID)
;


ALTER TABLE ADOPT
	ADD FOREIGN KEY (USERID)
	REFERENCES USER (USERID)
;


ALTER TABLE BUY
	ADD FOREIGN KEY (USERID)
	REFERENCES USER (USERID)
;


ALTER TABLE COMMENT
	ADD FOREIGN KEY (COMMENTNICK)
	REFERENCES USER (USERNICK)
;


ALTER TABLE COMMENT
	ADD FOREIGN KEY (COMMENTID)
	REFERENCES USER (USERID)
;


ALTER TABLE FAVORITES
	ADD FOREIGN KEY (USERID)
	REFERENCES USER (USERID)
;


ALTER TABLE POST
	ADD FOREIGN KEY (USERNICK)
	REFERENCES USER (USERNICK)
;


ALTER TABLE PRODUCT
	ADD FOREIGN KEY (USERNICK)
	REFERENCES USER (USERNICK)
;


ALTER TABLE PRODUCT
	ADD FOREIGN KEY (USERID)
	REFERENCES USER (USERID)
;


ALTER TABLE QUESTION
	ADD FOREIGN KEY (USERID)
	REFERENCES USER (USERID)
;



