-- 用户表
DROP TABLE IF EXISTS ME_USER;
CREATE TABLE ME_USER(
id bigint PRIMARY KEY AUTO_INCREMENT,
code char(20) BINARY DEFAULT '',
name varchar(50) BINARY DEFAULT '',
status char(1) DEFAULT 'I',
phone char(11) DEFAULT '',
phone_cfm char(1) DEFAULT 'N',
password varchar(32) BINARY DEFAULT NULL,
level smallint DEFAULT 0,
src char(1) DEFAULT '',
from_user_code char(30) DEFAULT '',
register_ip char(46) DEFAULT '0.0.0.0',
register_dt datetime DEFAULT CURRENT_TIMESTAMP,
last_login_dt datetime DEFAULT NULL,
union_id varchar(50) BINARY DEFAULT '',
open_id varchar(50) BINARY DEFAULT '',
open_id_ur varchar(50) BINARY DEFAULT '',
open_id_dt varchar(50) BINARY DEFAULT '',
wx_nick_name varchar(50) DEFAULT '',
wx_sex char(1) DEFAULT '',
wx_head_img_url varchar(250) DEFAULT '',
wx_province varchar(15) DEFAULT '',
wx_city varchar(15) DEFAULT '',
wx_country varchar(15) DEFAULT '',
wx_subscribe smallint DEFAULT 0,
wx_scene varchar(64) DEFAULT '',
wx_latitude varchar(20) DEFAULT '',
wx_longitude varchar(20) DEFAULT '',
wx_precision varchar(20) DEFAULT '',
wx_location_dt datetime DEFAULT NULL,
wx_qr_img varchar(250) DEFAULT '',
wx_qr_url varchar(250) DEFAULT '',
wx_qr_update_time datetime DEFAULT NULL,
remark varchar(100) DEFAULT '',
admin_user_id int DEFAULT 0,
update_time datetime DEFAULT CURRENT_TIMESTAMP,
create_time datetime DEFAULT CURRENT_TIMESTAMP,
INDEX index0(CODE),
INDEX index1(OPEN_ID_UR)
)ENGINE MYISAM;

-- 问诊人信息表
DROP TABLE IF EXISTS ME_USER_PATIENT;
CREATE TABLE ME_USER_PATIENT(
id bigint PRIMARY KEY AUTO_INCREMENT,
user_id bigint DEFAULT 0,
status char(1) DEFAULT 'A',
name varchar(50) BINARY DEFAULT '',
phone char(11) DEFAULT '',
phone_cfm char(1) DEFAULT 'N',
level smallint DEFAULT 0,
birthday date DEFAULT NULL,
height smallint DEFAULT 0,
weight smallint DEFAULT 0,
age smallint DEFAULT 0,
sex smallint DEFAULT 0,
is_allergy char(1) DEFAULT 'N',
medical_history varchar(2000) DEFAULT '',
update_time datetime DEFAULT CURRENT_TIMESTAMP,
create_time datetime DEFAULT CURRENT_TIMESTAMP,
INDEX index0(USER_ID)
)ENGINE MYISAM;

-- 医院表
DROP TABLE IF EXISTS ME_HOSPITAL;
CREATE TABLE ME_HOSPITAL(
id int PRIMARY KEY AUTO_INCREMENT,
name char(50) DEFAULT 'DT',
contact varchar(50) DEFAULT '',
address varchar(255) DEFAULT '',
update_time datetime DEFAULT CURRENT_TIMESTAMP,
create_time datetime DEFAULT CURRENT_TIMESTAMP
)ENGINE MYISAM;

-- 医生表
DROP TABLE IF EXISTS ME_DOCTOR;
CREATE TABLE ME_DOCTOR(
id bigint PRIMARY KEY NOT NULL AUTO_INCREMENT,
user_id bigint DEFAULT 0,
code char(20) DEFAULT '',
name varchar(20) DEFAULT '',
head_img varchar(255) DEFAULT '',
title varchar(20) DEFAULT '',
hospital_code varchar(20) DEFAULT '',
department_code varchar(20) DEFAULT '',
status char(1) DEFAULT 'I',
auth_type char(1) DEFAULT '',
average_star decimal(3,1) DEFAULT 0,
job_period smallint DEFAULT 0,
phone char(11) DEFAULT '',
phone_cfm char(1) DEFAULT 'N',
phone_visible char(1) DEFAULT 'N',
info text CHARACTER SET utf8mb4,
original_price decimal(13,2) DEFAULT 0,
actual_price decimal(13,2) DEFAULT 0,
aq_path varchar(255) DEFAULT '',
aq_path_dt DateTime DEFAULT NULL,
aq_path_url varchar(255) DEFAULT '',
gzh_qr_path varchar(255) DEFAULT '',
src char(1) DEFAULT '',
from_user_code char(30) DEFAULT '',
register_ip char(46) DEFAULT '0.0.0.0',
register_dt datetime DEFAULT CURRENT_TIMESTAMP,
last_login_dt datetime DEFAULT NULL,
remark varchar(255) DEFAULT '',
admin_user_id int DEFAULT 0,
update_time datetime DEFAULT CURRENT_TIMESTAMP,
create_time datetime DEFAULT CURRENT_TIMESTAMP,
INDEX index0(CODE)
)ENGINE MYISAM;

-- 标签表
DROP TABLE IF EXISTS ME_LABEL;
CREATE TABLE ME_LABEL(
id bigint PRIMARY KEY AUTO_INCREMENT,
type char(2) DEFAULT 'DT',
label_value varchar(32) DEFAULT '',
url varchar(255) DEFAULT '',
update_time datetime DEFAULT CURRENT_TIMESTAMP,
create_time datetime DEFAULT CURRENT_TIMESTAMP,
INDEX index0(TYPE)
)ENGINE MYISAM;

-- 标签关系表
DROP TABLE IF EXISTS ME_LABEL_REL;
CREATE TABLE ME_LABEL_REL(
id bigint PRIMARY KEY AUTO_INCREMENT,
type char(2) DEFAULT 'DT',
code char(20) DEFAULT '',
label_id bigint DEFAULT 0,
update_time datetime DEFAULT CURRENT_TIMESTAMP,
create_time datetime DEFAULT CURRENT_TIMESTAMP,
INDEX index0(TYPE, CODE)
)ENGINE MYISAM;

-- 收藏表
DROP TABLE IF EXISTS ME_FAVORITE;
CREATE TABLE ME_FAVORITE(
id bigint PRIMARY KEY AUTO_INCREMENT,
user_code char(20) DEFAULT '',
type char(2) DEFAULT 'DT',
follow_code varchar(32) DEFAULT '',
update_time datetime DEFAULT CURRENT_TIMESTAMP,
create_time datetime DEFAULT CURRENT_TIMESTAMP,
INDEX index0(USER_CODE, TYPE)
)ENGINE MYISAM;

-- 问诊表
DROP TABLE IF EXISTS ME_VISIT;
CREATE TABLE ME_VISIT(
id bigint PRIMARY KEY AUTO_INCREMENT,
user_code char(20) DEFAULT '',
doctor_code char(20) DEFAULT '',
status char(1) DEFAULT 'P',
origianl_price decimal(13,2) DEFAULT 0,
actual_pay decimal(13,2) DEFAULT 0,
use_coupon char(1) DEFAULT 'N',
inquiry_dt datetime DEFAULT CURRENT_TIMESTAMP,
inquiry_dt_last datetime DEFAULT NULL,
reply_dt datetime DEFAULT NULL,
reply_dt_last datetime DEFAULT NULL,
close_dt datetime DEFAULT NULL,
update_time datetime DEFAULT CURRENT_TIMESTAMP,
create_time datetime DEFAULT CURRENT_TIMESTAMP,
INDEX index0(USER_CODE, STATUS),
INDEX index1(DOCTOR_CODE, STATUS)
)ENGINE MYISAM;

-- 问诊明细表
DROP TABLE IF EXISTS ME_VISIT_LINE;
CREATE TABLE ME_VISIT_LINE(
id bigint PRIMARY KEY AUTO_INCREMENT,
visit_id bigint DEFAULT 0,
user_code char(20) DEFAULT '',
doctor_code char(20) DEFAULT '',
status char(1) DEFAULT 'A',
type char(1) DEFAULT 'T',
content text CHARACTER SET utf8mb4,
src char(1) DEFAULT '',
visible char(1) DEFAULT '',
update_time datetime DEFAULT CURRENT_TIMESTAMP,
create_time datetime DEFAULT CURRENT_TIMESTAMP,
INDEX index0(VISIT_ID)
)ENGINE MYISAM;

-- 附件表
DROP TABLE IF EXISTS ME_ATTACHMENT;
CREATE TABLE ME_ATTACHMENT(
id bigint PRIMARY KEY AUTO_INCREMENT,
src char(5) DEFAULT 'V',
sub_id bigint DEFAULT 0,
title varchar(50) DEFAULT '',
media_type char(1) DEFAULT 'P',
suffix char(4) DEFAULT '',
path varchar(255) DEFAULT '',
url varchar(255) DEFAULT '',
update_time datetime DEFAULT CURRENT_TIMESTAMP,
create_time datetime DEFAULT CURRENT_TIMESTAMP,
INDEX index0(SRC, SUB_ID)
)ENGINE MYISAM;

-- 反馈表
DROP TABLE IF EXISTS ME_FEEDBACK;
CREATE TABLE ME_FEEDBACK(
id bigint PRIMARY KEY AUTO_INCREMENT,
user_code char(20) DEFAULT '',
doctor_code char(20) DEFAULT '',
status char(1) DEFAULT 'P',
content varchar(500) DEFAULT '',
operate_dt datetime DEFAULT NULL,
admin_user_id int DEFAULT 0,
update_time datetime DEFAULT CURRENT_TIMESTAMP,
create_time datetime DEFAULT CURRENT_TIMESTAMP
)ENGINE MYISAM;

-- 账户表
DROP TABLE IF EXISTS ME_ACCOUNT;
CREATE TABLE ME_ACCOUNT(
id bigint PRIMARY KEY AUTO_INCREMENT,
type char(2) DEFAULT 'DT',
code char(20) BINARY DEFAULT '',
order_code char(20) DEFAULT '',
src char(10) DEFAULT 'O',
sub_src char(5) DEFAULT '',
sub_src_descr varchar(50) DEFAULT '',
amount decimal(13,2) DEFAULT 0,
note varchar(150) DEFAULT '',
update_time datetime DEFAULT CURRENT_TIMESTAMP,
create_time datetime DEFAULT CURRENT_TIMESTAMP,
INDEX index0(TYPE, CODE),
INDEX index1(SRC)
)ENGINE INNODB;

-- 设置表
DROP TABLE IF EXISTS ME_SETTING;
CREATE TABLE ME_SETTING(
id int PRIMARY KEY AUTO_INCREMENT,
key_code varchar(150) DEFAULT '',
key_value varchar(50) DEFAULT '',
key_type varchar(50) DEFAULT '',
update_time datetime DEFAULT CURRENT_TIMESTAMP,
create_time datetime DEFAULT CURRENT_TIMESTAMP,
INDEX index0(KEY_CODE)
)ENGINE MYISAM;

-- 付款队列表
DROP TABLE IF EXISTS ME_WX_PAYMENT_LINE;
CREATE TABLE ME_WX_PAYMENT_LINE(
id bigint PRIMARY KEY AUTO_INCREMENT,
open_id varchar(50) BINARY DEFAULT '',
doctor_code char(20) BINARY DEFAULT '',
cd_shop char(20) BINARY DEFAULT '',
src char(10) DEFAULT '',
amount int DEFAULT 0,
status char(10) DEFAULT 'PEDDING',
submit_dt datetime DEFAULT CURRENT_TIMESTAMP,
re_user_name varchar(32) BINARY DEFAULT '',
check_name char(20) DEFAULT '',
descr varchar(100) DEFAULT '',
spbill_create_ip char(32) DEFAULT '',
app_id varchar(50) BINARY DEFAULT '',
mch_id varchar(50) DEFAULT '',
nonce_str char(32) BINARY DEFAULT '',
sign char(32) BINARY DEFAULT '',
partner_trade_no varchar(50) DEFAULT '',
trade_dt date DEFAULT NULL,
return_code varchar(16) DEFAULT '',
return_msg varchar(128) DEFAULT '',
result_code varchar(16) DEFAULT '',
err_code varchar(32) DEFAULT '',
err_code_des varchar(128) DEFAULT '',
payment_no varchar(50) DEFAULT '',
payment_time varchar(30) DEFAULT '',
update_time datetime DEFAULT CURRENT_TIMESTAMP,
create_time datetime DEFAULT CURRENT_TIMESTAMP,
remark varchar(200) DEFAULT '',
INDEX index0(OPEN_ID, TRADE_DT),
INDEX index1(STATUS)
)ENGINE INNODB;
