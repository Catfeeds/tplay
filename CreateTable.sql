-- 用户表
DROP TABLE IF EXISTS ME_USER;
CREATE TABLE ME_USER(
ID bigint PRIMARY KEY AUTO_INCREMENT,
CODE char(20) BINARY DEFAULT '',
NAME varchar(50) BINARY DEFAULT '',
STATUS char(1) DEFAULT 'I',
PHONE char(11) DEFAULT '',
PHONE_CFM char(1) DEFAULT 'N',
PASSWORD varchar(32) BINARY DEFAULT NULL,
LEVEL smallint DEFAULT 0,
BIRTHDAY date DEFAULT NULL,
HEIGHT smallint DEFAULT 0,
WEIGHT smallint DEFAULT 0,
SRC char(1) DEFAULT '',
FROM_USER_CODE char(30) DEFAULT '',
REGISTER_IP char(46) DEFAULT '0.0.0.0',
REGISTER_DT datetime DEFAULT CURRENT_TIMESTAMP,
LAST_LOGIN_DT datetime DEFAULT NULL,
UNION_ID varchar(50) BINARY DEFAULT '',
OPEN_ID varchar(50) BINARY DEFAULT '',
OPEN_ID_UR varchar(50) BINARY DEFAULT '',
WX_NICK_NAME varchar(50) DEFAULT '',
WX_SEX char(1) DEFAULT '',
WX_HEAD_IMG_URL varchar(250) DEFAULT '',
WX_PROVINCE varchar(15) DEFAULT '',
WX_CITY varchar(15) DEFAULT '',
WX_COUNTRY varchar(15) DEFAULT '',
WX_SUBSCRIBE smallint DEFAULT 0,
WX_SCENE varchar(64) DEFAULT '',
WX_LATITUDE varchar(20) DEFAULT '',
WX_LONGITUDE varchar(20) DEFAULT '',
WX_PRECISION varchar(20) DEFAULT '',
WX_LOCATION_DT datetime DEFAULT NULL,
WX_QR_IMG varchar(250) DEFAULT '',
WX_QR_URL varchar(250) DEFAULT '',
WX_QR_UPDATE_DT datetime DEFAULT NULL,
REMARK varchar(100) DEFAULT '',
ADMIN_USER_ID int DEFAULT 0,
UPDATE_DT datetime DEFAULT NULL,
CREATE_DT datetime DEFAULT CURRENT_TIMESTAMP,
INDEX index0(CODE),
INDEX index1(OPEN_ID_UR)
)ENGINE MYISAM;

-- 医生表
DROP TABLE IF EXISTS ME_DOCTOR;
CREATE TABLE ME_DOCTOR(
ID bigint PRIMARY KEY NOT NULL AUTO_INCREMENT,
USER_ID bigint DEFAULT 0,
CODE char(20) DEFAULT '',
NAME varchar(20) DEFAULT '',
HEAD_IMG varchar(255) DEFAULT '',
TITLE varchar(20) DEFAULT '',
HOSPITAL_CODE varchar(20) DEFAULT '',
DEPARTMENT_CODE varchar(20) DEFAULT '',
STATUS char(1) DEFAULT 'I',
AUTH_TYPE char(1) DEFAULT '',
AVERAGE_STAR decimal(3,1) DEFAULT 0,
JOB_PERIOD smallint DEFAULT 0,
PHONE char(11) DEFAULT '',
PHONE_CFM char(1) DEFAULT 'N',
PHONE_VISIBLE char(1) DEFAULT 'N',
INFO text CHARACTER SET utf8mb4,
ORIGINAL_PRICE decimal(13,2) DEFAULT 0,
ACTUAL_PRICE decimal(13,2) DEFAULT 0,
AQ_PATH varchar(255) DEFAULT '',
AQ_PATH_DT DateTime DEFAULT NULL,
AQ_PATH_URL varchar(255) DEFAULT '',
GZH_QR_PATH varchar(255) DEFAULT '',
SRC char(1) DEFAULT '',
FROM_USER_CODE char(30) DEFAULT '',
REGISTER_IP char(46) DEFAULT '0.0.0.0',
REGISTER_DT datetime DEFAULT CURRENT_TIMESTAMP,
LAST_LOGIN_DT datetime DEFAULT NULL,
UNION_ID varchar(50) BINARY DEFAULT '',
OPEN_ID varchar(50) BINARY DEFAULT '',
OPEN_ID_DT varchar(50) BINARY DEFAULT '',
WX_NICK_NAME varchar(50) DEFAULT '',
WX_SEX char(1) DEFAULT '',
WX_HEAD_IMG_URL varchar(250) DEFAULT '',
WX_PROVINCE varchar(15) DEFAULT '',
WX_CITY varchar(15) DEFAULT '',
WX_COUNTRY varchar(15) DEFAULT '',
WX_SUBSCRIBE smallint DEFAULT 0,
WX_SCENE varchar(64) DEFAULT '',
WX_LATITUDE varchar(20) DEFAULT '',
WX_LONGITUDE varchar(20) DEFAULT '',
WX_PRECISION varchar(20) DEFAULT '',
WX_LOCATION_DT datetime DEFAULT NULL,
WX_QR_IMG varchar(250) DEFAULT '',
WX_QR_URL varchar(250) DEFAULT '',
WX_QR_UPDATE_DT datetime DEFAULT NULL,
REMARK varchar(255) DEFAULT '',
ADMIN_USER_ID int DEFAULT 0,
UPDATE_DT DateTime DEFAULT NULL,
CREATE_DT DateTime DEFAULT CURRENT_TIMESTAMP,
INDEX index0(CODE),
INDEX index1(OPEN_ID_DT)
)ENGINE MYISAM;

-- 标签表
DROP TABLE IF EXISTS ME_LABEL;
CREATE TABLE ME_LABEL(
ID bigint PRIMARY KEY AUTO_INCREMENT,
TYPE char(2) DEFAULT 'DT',
LABEL_VALUE varchar(32) DEFAULT '',
URL varchar(255) DEFAULT '',
CREATE_DT datetime DEFAULT CURRENT_TIMESTAMP,
INDEX index0(TYPE)
)ENGINE MYISAM;

-- 标签关系表
DROP TABLE IF EXISTS ME_LABEL_REL;
CREATE TABLE ME_LABEL_REL(
ID bigint PRIMARY KEY AUTO_INCREMENT,
TYPE char(2) DEFAULT 'DT',
CODE char(20) DEFAULT '',
LABEL_ID bigint DEFAULT 0,
CREATE_DT datetime DEFAULT CURRENT_TIMESTAMP,
INDEX index0(TYPE, CODE)
)ENGINE MYISAM;

-- 收藏表
DROP TABLE IF EXISTS ME_FAVORITE;
CREATE TABLE ME_FAVORITE(
ID bigint PRIMARY KEY AUTO_INCREMENT,
USER_CODE char(20) DEFAULT '',
TYPE char(2) DEFAULT 'DT',
FOLLOW_CODE varchar(32) DEFAULT '',
CREATE_DT datetime DEFAULT CURRENT_TIMESTAMP,
INDEX index0(USER_CODE, TYPE)
)ENGINE MYISAM;

-- 问诊表
DROP TABLE IF EXISTS ME_VISIT;
CREATE TABLE ME_VISIT(
ID bigint PRIMARY KEY AUTO_INCREMENT,
USER_CODE char(20) DEFAULT '',
DOCTOR_CODE char(20) DEFAULT '',
STATUS char(1) DEFAULT 'P',
ORIGIANL_PRICE decimal(13,2) DEFAULT 0,
ACTUAL_PAY decimal(13,2) DEFAULT 0,
USE_COUPON char(1) DEFAULT 'N',
INQUIRY_DT datetime DEFAULT CURRENT_TIMESTAMP,
INQUIRY_DT_LAST datetime DEFAULT NULL,
REPLY_DT datetime DEFAULT NULL,
REPLY_DT_LAST datetime DEFAULT NULL,
CLOSE_DT datetime DEFAULT NULL,
INDEX index0(USER_CODE, STATUS),
INDEX index1(DOCTOR_CODE, STATUS)
)ENGINE MYISAM;

-- 问诊明细表
DROP TABLE IF EXISTS ME_VISIT_LINE;
CREATE TABLE ME_VISIT_LINE(
ID bigint PRIMARY KEY AUTO_INCREMENT,
VISIT_ID bigint DEFAULT 0,
USER_CODE char(20) DEFAULT '',
DOCTOR_CODE char(20) DEFAULT '',
STATUS char(1) DEFAULT 'A',
TYPE char(1) DEFAULT 'T',
CONTENT text CHARACTER SET utf8mb4,
SRC char(1) DEFAULT '',
VISIBLE char(1) DEFAULT '',
CREATE_DT datetime DEFAULT CURRENT_TIMESTAMP,
INDEX index0(VISIT_ID)
)ENGINE MYISAM;

-- 附件表
DROP TABLE IF EXISTS ME_ATTACHMENT;
CREATE TABLE ME_ATTACHMENT(
ID bigint PRIMARY KEY AUTO_INCREMENT,
SRC char(5) DEFAULT 'V',
SUB_ID bigint DEFAULT 0,
TITLE varchar(50) DEFAULT '',
MEDIA_TYPE char(1) DEFAULT 'P',
SUFFIX char(4) DEFAULT '',
PATH varchar(255) DEFAULT '',
URL varchar(255) DEFAULT '',
CREATE_DT datetime DEFAULT CURRENT_TIMESTAMP,
INDEX index0(SRC, SUB_ID)
)ENGINE MYISAM;

-- 反馈表
DROP TABLE IF EXISTS ME_FEEDBACK;
CREATE TABLE ME_FEEDBACK(
ID bigint PRIMARY KEY AUTO_INCREMENT,
USER_CODE char(20) DEFAULT '',
DOCTOR_CODE char(20) DEFAULT '',
STATUS char(1) DEFAULT 'P',
CONTENT varchar(500) DEFAULT '',
OPERATE_DT datetime DEFAULT NULL,
ADMIN_USER_ID int DEFAULT 0,
CREATE_DT datetime DEFAULT CURRENT_TIMESTAMP
)ENGINE MYISAM;

-- 账户表
DROP TABLE IF EXISTS ME_ACCOUNT;
CREATE TABLE ME_ACCOUNT(
ID bigint PRIMARY KEY AUTO_INCREMENT,
TYPE char(2) DEFAULT 'DT',
CODE char(20) BINARY DEFAULT '',
ORDER_CODE char(20) DEFAULT '',
SRC char(10) DEFAULT 'O',
SUB_SRC char(5) DEFAULT '',
SUB_SRC_DESCR varchar(50) DEFAULT '',
AMOUNT decimal(13,2) DEFAULT 0,
NOTE varchar(150) DEFAULT '',
CREATE_DT datetime DEFAULT CURRENT_TIMESTAMP,
INDEX index0(TYPE, CODE),
INDEX index1(SRC)
)ENGINE INNODB;

-- 设置表
DROP TABLE IF EXISTS ME_SETTING;
CREATE TABLE ME_SETTING(
ID int PRIMARY KEY AUTO_INCREMENT,
KEY_CODE varchar(150) DEFAULT '',
KEY_VALUE varchar(50) DEFAULT '',
KEY_TYPE varchar(50) DEFAULT '',
UPDATE_DT datetime DEFAULT NULL,
CREATE_DT datetime DEFAULT CURRENT_TIMESTAMP,
INDEX index0(KEY_CODE)
)ENGINE MYISAM;

-- 付款队列表
DROP TABLE IF EXISTS ME_WX_PAYMENT_LINE;
CREATE TABLE ME_WX_PAYMENT_LINE(
ID bigint PRIMARY KEY AUTO_INCREMENT,
OPEN_ID varchar(50) BINARY DEFAULT '',
DOCTOR_CODE char(20) BINARY DEFAULT '',
CD_SHOP char(20) BINARY DEFAULT '',
SRC char(10) DEFAULT '',
AMOUNT int DEFAULT 0,
STATUS char(10) DEFAULT 'PEDDING',
SUBMIT_DT datetime DEFAULT CURRENT_TIMESTAMP,
RE_USER_NAME varchar(32) BINARY DEFAULT '',
CHECK_NAME char(20) DEFAULT '',
DESCR varchar(100) DEFAULT '',
SPBILL_CREATE_IP char(32) DEFAULT '',
APP_ID varchar(50) BINARY DEFAULT '',
MCH_ID varchar(50) DEFAULT '',
NONCE_STR char(32) BINARY DEFAULT '',
SIGN char(32) BINARY DEFAULT '',
PARTNER_TRADE_NO varchar(50) DEFAULT '',
TRADE_DT date DEFAULT NULL,
RETURN_CODE varchar(16) DEFAULT '',
RETURN_MSG varchar(128) DEFAULT '',
RESULT_CODE varchar(16) DEFAULT '',
ERR_CODE varchar(32) DEFAULT '',
ERR_CODE_DES varchar(128) DEFAULT '',
PAYMENT_NO varchar(50) DEFAULT '',
PAYMENT_TIME varchar(30) DEFAULT '',
UPDATE_DT datetime DEFAULT NULL,
REMARK varchar(200) DEFAULT '',
INDEX index0(OPEN_ID, TRADE_DT),
INDEX index1(STATUS)
)ENGINE INNODB;
