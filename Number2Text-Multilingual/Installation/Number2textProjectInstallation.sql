set feedback off
set define off
prompt Installation Of Number2Text Project and its objects and data

prompt Creating sequence SEQ_MULTI_LANG_ID
create sequence SEQ_MULTI_LANG_ID
minvalue 0
maxvalue 9999999999
start with 13422
increment by 1
nocache
cycle
order;

prompt Creating table MULTI_LANG_TEXT_TBL
create table MULTI_LANG_TEXT_TBL
(
  pk_multi_lang_id NUMBER(10) not null,
  lang                   VARCHAR2(30) not null,
  text                   VARCHAR2(4000),
  op_id                  VARCHAR2(128),
  op_Date                DATE default sysdate
)
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
prompt Creating primary key constraints PK_MULTI_LANG_ID of table MULTI_LANG_TEXT_TBL
alter table MULTI_LANG_TEXT_TBL
  add constraint PK_MULTI_LANG_ID primary key (PK_MULTI_LANG_ID, LANG)
  using index 
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
prompt Importing table data into multi_lang_text_tbl...

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10277, 'ENG', 'one', 'SENOL', to_date('08-09-2020 16:03:07', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10277, 'TUR', 'BÝR', 'SENOL', to_date('08-09-2020 16:03:07', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10277, 'GER', 'Eins', 'SENOL', to_date('08-09-2020 16:03:07', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10278, 'TUR', 'ÝKÝ', 'SENOL', to_date('08-09-2020 16:03:11', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10278, 'GER', 'Zwei', 'SENOL', to_date('08-09-2020 16:03:11', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10278, 'ENG', 'two', 'SENOL', to_date('08-09-2020 16:03:11', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10279, 'ENG', 'three', 'SENOL', to_date('08-09-2020 16:03:15', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10279, 'TUR', 'ÜÇ', 'SENOL', to_date('08-09-2020 16:03:15', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10279, 'GER', 'Drei', 'SENOL', to_date('08-09-2020 16:03:15', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10280, 'ENG', 'four', 'SENOL', to_date('08-09-2020 16:04:02', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10280, 'TUR', 'DÖRT', 'SENOL', to_date('08-09-2020 16:04:02', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10280, 'GER', 'Vier', 'SENOL', to_date('08-09-2020 16:04:02', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10281, 'TUR', 'BEÞ', 'SENOL', to_date('08-09-2020 16:04:05', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10281, 'GER', 'Fünf', 'SENOL', to_date('08-09-2020 16:04:05', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10281, 'ENG', 'five', 'SENOL', to_date('08-09-2020 16:04:05', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10282, 'GER', 'Sechs', 'SENOL', to_date('08-09-2020 16:04:09', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10282, 'ENG', 'six', 'SENOL', to_date('08-09-2020 16:04:09', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10282, 'TUR', 'ALTI', 'SENOL', to_date('08-09-2020 16:04:09', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10283, 'ENG', 'seven', 'SENOL', to_date('08-09-2020 16:04:12', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10283, 'GER', 'Sieben', 'SENOL', to_date('08-09-2020 16:04:12', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10283, 'TUR', 'YEDÝ', 'SENOL', to_date('08-09-2020 16:04:12', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10284, 'ENG', 'eigth', 'SENOL', to_date('08-09-2020 16:04:16', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10284, 'TUR', 'SEKÝZ', 'SENOL', to_date('08-09-2020 16:04:16', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10284, 'GER', 'Acht', 'SENOL', to_date('08-09-2020 16:04:16', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10285, 'GER', 'Neun', 'SENOL', to_date('08-09-2020 16:04:20', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10285, 'TUR', 'DOKUZ', 'SENOL', to_date('08-09-2020 16:04:20', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10285, 'ENG', 'nine', 'SENOL', to_date('08-09-2020 16:04:20', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10286, 'TUR', 'ON', 'SENOL', to_date('08-09-2020 16:04:25', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10286, 'GER', 'Zehn', 'SENOL', to_date('08-09-2020 16:04:25', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10286, 'ENG', 'ten', 'SENOL', to_date('08-09-2020 16:04:25', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10287, 'ENG', 'twenty', 'SENOL', to_date('08-09-2020 16:04:29', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10287, 'GER', 'Zwanzig', 'SENOL', to_date('08-09-2020 16:04:29', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10287, 'TUR', 'YÝRMÝ', 'SENOL', to_date('08-09-2020 16:04:29', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10288, 'GER', 'Dreißig', 'SENOL', to_date('08-09-2020 16:04:34', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10288, 'TUR', 'OTUZ', 'SENOL', to_date('08-09-2020 16:04:34', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10288, 'ENG', 'thirty', 'SENOL', to_date('08-09-2020 16:04:34', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10289, 'TUR', 'KIRK', 'SENOL', to_date('08-09-2020 16:04:39', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10289, 'GER', 'Vierzig', 'SENOL', to_date('08-09-2020 16:04:39', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10289, 'ENG', 'fourty', 'SENOL', to_date('08-09-2020 16:04:39', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10290, 'TUR', 'ELLÝ', 'SENOL', to_date('08-09-2020 16:04:44', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10290, 'GER', 'Fünfzig', 'SENOL', to_date('08-09-2020 16:04:44', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10290, 'ENG', 'fifty', 'SENOL', to_date('08-09-2020 16:04:44', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10291, 'ENG', 'sixty', 'SENOL', to_date('08-09-2020 16:04:48', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10291, 'GER', 'Sechszig', 'SENOL', to_date('08-09-2020 16:04:48', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10291, 'TUR', 'ALTMIÞ', 'SENOL', to_date('08-09-2020 16:04:48', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10292, 'ENG', 'seventy', 'SENOL', to_date('08-09-2020 16:04:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10292, 'TUR', 'YETMÝÞ', 'SENOL', to_date('08-09-2020 16:04:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10292, 'GER', 'Siebzig', 'SENOL', to_date('08-09-2020 16:04:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10293, 'GER', 'Achtzig', 'SENOL', to_date('08-09-2020 16:04:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10293, 'ENG', 'eigthy', 'SENOL', to_date('08-09-2020 16:04:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10293, 'TUR', 'SEKSEN', 'SENOL', to_date('08-09-2020 16:04:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10294, 'ENG', 'ninety', 'SENOL', to_date('08-09-2020 16:05:01', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10294, 'GER', 'Neunzig', 'SENOL', to_date('08-09-2020 16:05:01', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10294, 'TUR', 'DOKSAN', 'SENOL', to_date('08-09-2020 16:05:01', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10295, 'TUR', 'YÜZ', 'SENOL', to_date('08-09-2020 16:05:07', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10295, 'GER', 'hundert', 'SENOL', to_date('08-09-2020 16:05:07', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10295, 'ENG', 'hundred', 'SENOL', to_date('08-09-2020 16:05:07', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10296, 'ENG', 'two hundret', 'SENOL', to_date('08-09-2020 16:05:11', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10296, 'TUR', 'ÝKÝYÜZ', 'SENOL', to_date('08-09-2020 16:05:11', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10296, 'GER', 'Zweihundert', 'SENOL', to_date('08-09-2020 16:05:11', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10297, 'TUR', 'ÜÇYÜZ', 'SENOL', to_date('08-09-2020 16:05:15', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10297, 'GER', 'Dreihundert', 'SENOL', to_date('08-09-2020 16:05:15', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10297, 'ENG', 'three hundret', 'SENOL', to_date('08-09-2020 16:05:15', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10298, 'TUR', 'DÖRTYÜZ', 'SENOL', to_date('08-09-2020 16:05:20', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10298, 'GER', 'Vierhundert', 'SENOL', to_date('08-09-2020 16:05:20', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10298, 'ENG', 'four hundret', 'SENOL', to_date('08-09-2020 16:05:20', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10299, 'TUR', 'BEÞYÜZ', 'SENOL', to_date('08-09-2020 16:05:24', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10299, 'ENG', 'five hundret', 'SENOL', to_date('08-09-2020 16:05:24', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10299, 'GER', 'Fünfhundert', 'SENOL', to_date('08-09-2020 16:05:24', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10300, 'GER', 'Sechshundert', 'SENOL', to_date('08-09-2020 16:05:28', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10300, 'ENG', 'six hundret', 'SENOL', to_date('08-09-2020 16:05:28', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10300, 'TUR', 'ALTIYÜZ', 'SENOL', to_date('08-09-2020 16:05:28', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10301, 'ENG', 'seven hundret', 'SENOL', to_date('08-09-2020 16:05:32', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10301, 'GER', 'Siebenhundert', 'SENOL', to_date('08-09-2020 16:05:32', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10301, 'TUR', 'YEDÝYÜZ', 'SENOL', to_date('08-09-2020 16:05:32', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10302, 'GER', 'Achthundert', 'SENOL', to_date('08-09-2020 16:05:37', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10302, 'TUR', 'SEKÝZYÜZ', 'SENOL', to_date('08-09-2020 16:05:37', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10302, 'ENG', 'eigth hundret', 'SENOL', to_date('08-09-2020 16:05:37', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10303, 'GER', 'Neunhundert', 'SENOL', to_date('08-09-2020 16:05:41', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10303, 'TUR', 'DOKUZYÜZ', 'SENOL', to_date('08-09-2020 16:05:41', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10303, 'ENG', 'nine hundret', 'SENOL', to_date('08-09-2020 16:05:41', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10304, 'ENG', 'thousand', 'SENOL', to_date('08-09-2020 16:06:30', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10304, 'TUR', 'BÝN', 'SENOL', to_date('08-09-2020 16:06:30', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10304, 'GER', 'Tausend', 'SENOL', to_date('08-09-2020 16:06:30', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10305, 'ENG', 'million', 'SENOL', to_date('08-09-2020 16:06:39', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10305, 'TUR', 'MÝLYON', 'SENOL', to_date('08-09-2020 16:06:39', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10305, 'GER', 'Million', 'SENOL', to_date('08-09-2020 16:06:39', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10306, 'TUR', 'MÝLYAR', 'SENOL', to_date('08-09-2020 16:06:49', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10306, 'ENG', 'billion', 'SENOL', to_date('08-09-2020 16:06:49', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10306, 'GER', 'Milliarde', 'SENOL', to_date('08-09-2020 16:06:49', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10336, 'GER', 'elf', 'SENOL', to_date('10-09-2020 16:09:03', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10336, 'ENG', 'eleven', 'SENOL', to_date('10-09-2020 16:09:03', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10336, 'TUR', 'ON BÝR', 'SENOL', to_date('10-09-2020 16:09:03', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10337, 'TUR', 'ON ÝKÝ', 'SENOL', to_date('10-09-2020 16:09:12', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10337, 'ENG', 'twelve', 'SENOL', to_date('10-09-2020 16:09:12', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10337, 'GER', 'zwölf', 'SENOL', to_date('10-09-2020 16:09:12', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10338, 'GER', 'dreizehn', 'SENOL', to_date('10-09-2020 16:09:18', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10338, 'ENG', 'thirteen', 'SENOL', to_date('10-09-2020 16:09:18', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10338, 'TUR', 'ON ÜÇ', 'SENOL', to_date('10-09-2020 16:09:18', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10339, 'ENG', 'fourteen', 'SENOL', to_date('10-09-2020 16:09:25', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10339, 'TUR', 'ON DÖRT', 'SENOL', to_date('10-09-2020 16:09:25', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10339, 'GER', 'vierzehn', 'SENOL', to_date('10-09-2020 16:09:25', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10340, 'ENG', 'fifteen', 'SENOL', to_date('10-09-2020 16:09:33', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10340, 'GER', 'fünfzehn', 'SENOL', to_date('10-09-2020 16:09:33', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10340, 'TUR', 'ON BEÞ', 'SENOL', to_date('10-09-2020 16:09:33', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10341, 'ENG', 'sixteen', 'SENOL', to_date('10-09-2020 16:09:40', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10341, 'GER', 'sechszehn', 'SENOL', to_date('10-09-2020 16:09:40', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10341, 'TUR', 'ON ALTI', 'SENOL', to_date('10-09-2020 16:09:40', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10342, 'TUR', 'ON YEDÝ', 'SENOL', to_date('10-09-2020 16:09:47', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10342, 'GER', 'siebzehn', 'SENOL', to_date('10-09-2020 16:09:47', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10342, 'ENG', 'seventeen', 'SENOL', to_date('10-09-2020 16:09:47', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10343, 'ENG', 'eighteen', 'SENOL', to_date('10-09-2020 16:09:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10343, 'TUR', 'ON SEKÝZ', 'SENOL', to_date('10-09-2020 16:09:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10343, 'GER', 'achtzehn', 'SENOL', to_date('10-09-2020 16:09:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10344, 'GER', 'neunzehn', 'SENOL', to_date('10-09-2020 16:10:03', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10344, 'TUR', 'ON DOKUZ', 'SENOL', to_date('10-09-2020 16:10:03', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10344, 'ENG', 'nineteen', 'SENOL', to_date('10-09-2020 16:10:03', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10357, 'TUR', 'TRÝLYON', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10357, 'ENG', 'trillion', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10357, 'GER', 'Billion', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10358, 'TUR', 'KATRÝLYON', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10358, 'GER', 'Billiarde', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10358, 'ENG', 'quadrillion', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10359, 'ENG', 'quintillion', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10359, 'GER', 'Trillion', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10359, 'TUR', 'KENTÝLYON', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10360, 'ENG', 'sexion', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10360, 'TUR', 'SEKSÝLYON', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10360, 'GER', 'Sexion', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10361, 'ENG', 'septillion', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10361, 'TUR', 'SEPTÝLYON', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10361, 'GER', 'Septillion', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10362, 'GER', 'PROZENTSATZ', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10362, 'TUR', 'YÜZDE', 'SENOL', to_date('27-04-2022 15:32:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10362, 'ENG', 'PERCENTAGE', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10363, 'ENG', 'per thousand', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10363, 'TUR', 'BÝNDE', 'SENOL', to_date('27-04-2022 15:32:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10363, 'GER', 'pro tausend', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10364, 'GER', 'PRO MILLION', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10364, 'TUR', 'MÝLYONDA', 'SENOL', to_date('27-04-2022 15:32:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10364, 'ENG', 'PER MILLION', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10365, 'GER', 'IN MILLIARDEN', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10365, 'TUR', 'MÝLYARDA', 'SENOL', to_date('27-04-2022 15:32:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10365, 'ENG', 'IN BILLION', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10366, 'GER', 'IN BILLIONEN', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10366, 'ENG', 'IN TRILLION', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10366, 'TUR', 'TRÝLYONDA', 'SENOL', to_date('27-04-2022 15:32:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10367, 'GER', 'QUATRILION', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10367, 'TUR', 'KATRÝLYONDA', 'SENOL', to_date('27-04-2022 15:32:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10367, 'ENG', 'QUATRILION', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10368, 'GER', 'IN ZENTILLIONEN', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10368, 'TUR', 'KENTÝLYONDA', 'SENOL', to_date('27-04-2022 15:32:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10368, 'ENG', 'IN CENTILLION', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10369, 'ENG', 'IN SEXILLION', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10369, 'GER', 'in Sexillion', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10369, 'TUR', 'SEKSÝLYONDA', 'SENOL', to_date('27-04-2022 15:32:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10370, 'GER', 'IN DER SEPTILLION', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10370, 'TUR', 'SEPTÝLYONDA', 'SENOL', to_date('27-04-2022 15:32:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10370, 'ENG', 'IN THE SEPTILLION', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10371, 'ENG', 'Türkish Lira', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10371, 'GER', 'Türkische Lira', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10371, 'TUR', 'TÜRK LÝRASI', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10372, 'ENG', 'US Dollar', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10372, 'GER', 'US-Dollar', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10372, 'TUR', 'ABD DOLARI', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10373, 'ENG', 'Euro', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10373, 'GER', 'Euro', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10373, 'TUR', 'AVRO', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10374, 'ENG', 'Pound Sterling', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10374, 'GER', 'Pfund Sterling', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10374, 'TUR', 'STERLIN', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (13419, 'ENG', 'Tenths', 'SENOL', to_date('10-09-2020 16:09:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (13419, 'TUR', 'ONDA', 'SENOL', to_date('10-09-2020 16:09:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (13419, 'GER', 'Zehntel', 'SENOL', to_date('10-09-2020 16:09:12', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (13420, 'ENG', 'Yes', 'SENOL', to_date('10-09-2020 16:09:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (13420, 'TUR', 'Evet', 'SENOL', to_date('10-09-2020 16:09:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (13420, 'GER', 'Ja', 'SENOL', to_date('10-09-2020 16:09:12', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (13421, 'ENG', 'No', 'SENOL', to_date('10-09-2020 16:09:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (13421, 'TUR', 'Hayýr', 'SENOL', to_date('10-09-2020 16:09:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into multi_lang_text_tbl (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (13421, 'GER', 'Nein', 'SENOL', to_date('10-09-2020 16:09:12', 'dd-mm-yyyy hh24:mi:ss'));


  
prompt create table CURRENCY_LOOKUP_TBL
create table CURRENCY_LOOKUP_TBL
(
  currency       VARCHAR2(3) not null,
  currency_Name    VARCHAR2(50 CHAR),
  curr_seq     NUMBER(3),
  decimal_digit       NUMBER(2),
  decimal_name   VARCHAR2(10 CHAR),
  op_id       VARCHAR2(12 CHAR),
  op_date     DATE default sysdate
)
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 48K
    next 1M
    minextents 1
    maxextents unlimited
  );
prompt Creating primary key constraints PK_CURRENCY of table CURRENCY_LOOKUP_TBL
alter table CURRENCY_LOOKUP_TBL
  add constraint PK_CURRENCY primary key (CURRENCY)
  using index 
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
prompt Create Unique key constraints UQ_CURRENCY of table CURRENCY_LOOKUP_TBL
 
alter table CURRENCY_LOOKUP_TBL
  add constraint UQ_CURRENCY unique (CURR_SEQ)
  using index 
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Importing table data into CURRENCY_LOOKUP_TBL...

insert into CURRENCY_LOOKUP_TBL (CURRENCY, CURRENCY_NAME, CURR_SEQ, DECIMAL_DIGIT, DECIMAL_NAME, OP_ID, OP_DATE)
values ('TL', 'TÜRK LÝRASI', 1, 2, 'KURUÞ', 'SENOL', to_date('01-09-2020 08:30:22', 'dd-mm-yyyy hh24:mi:ss'));

insert into CURRENCY_LOOKUP_TBL (CURRENCY, CURRENCY_NAME, CURR_SEQ, DECIMAL_DIGIT, DECIMAL_NAME, OP_ID, OP_DATE)
values ('USD', 'ABD DOLARI', 2, 2, 'CENT', 'SENOL', to_date('01-09-2020 08:30:22', 'dd-mm-yyyy hh24:mi:ss'));

insert into CURRENCY_LOOKUP_TBL (CURRENCY, CURRENCY_NAME, CURR_SEQ, DECIMAL_DIGIT, DECIMAL_NAME, OP_ID, OP_DATE)
values ('EUR', 'AVRO', 3, 2, 'CENT', 'SENOL', to_date('01-09-2020 08:30:22', 'dd-mm-yyyy hh24:mi:ss'));

insert into CURRENCY_LOOKUP_TBL (CURRENCY, CURRENCY_NAME, CURR_SEQ, DECIMAL_DIGIT, DECIMAL_NAME, OP_ID, OP_DATE)
values ('GBP', 'STERLIN', 4, 2, 'PENY', 'SENOL', to_date('01-09-2020 08:30:22', 'dd-mm-yyyy hh24:mi:ss'));

prompt Creating function number2text....
create or replace function number2text(p_Number         in number,
                                       p_Currency       in varchar2 := null,
                                       p_Lang           in varchar2 := null,
                                       p_Using_Grouping in varchar2 := null)
  return varchar2 is
  /* 
    Purpose:
    Conversion of numbers into text in the following languages: Turkish, English and German
    How to use:
    p_Number          => Number Value
    p_Currency        => Following valid currencies USD, GBP, TL or EUR are predefined in currency_lookup_tbl
    p_Lang            => Language Code for example <ENG>lish / <GER>man / <TUR>kish
    p_Using_Grouping => <Y>es / <N>o, null mean <N>o
       
    Example : p_Date => 123 p_CUrrency=> TL p_Lang =>'GER'  Result => einhundertdreiundzwanzig TL-Türkische Lira fünfundvierzig
    German  : Der Buchstabe 'Y' für die Variable p_Using_Grouping hat im Deutschensprache keine Wirkung.
    English : The letter 'Y' for the variable p_Using_Grouping has no effect in German Language.
    Turkish : p_Using_Grouping deðiþkeni için 'Y' harfi Almanca dilinde etkisiz.
    Change Log
    Date        By Whom               Description
    ----------  --------------------- --------------------------------------------------------------
    01.09.2020  Senol YILMAZ          Created
  
  */
  v_result         varchar2(32767);
  absolutenumber   number;
  absoluenumberstr varchar2(500);
  decimalNumber    number;
  decimalNumberStr varchar2(500);
  v_digit_grouping varchar2(1);
  ust              integer;
  ctrl             integer;
  v_currency       varchar2(65) := case p_Currency
                                     when chr(49792) then
                                      'EUR'
                                     when chr(63) then
                                      'TL'
                                     when chr(36) then
                                      'USD'
                                     when chr(49827) then
                                      'GBP'
                                     else
                                      p_Currency
                                   end;
  v_Currency_name  varchar2(50);
  v_decimal_name   varchar2(10);
  v_decimal        number;
  v_Space          varchar2(1);
  v_lang           varchar2(3) := coalesce(p_Lang, 'ENG');
  v_on_ek          boolean;
  v_start          integer;
  v_length         integer;
  v_decimal_Upper  integer(3);
  v_charNum        varchar2(60) := to_char(p_Number,
                                           '999999999999999999999999D999999999');
  type digit is table of varchar2(100) index by binary_integer;
  ones_digit  digit;
  tens_digit  digit;
  upper_digit digit;
  exceptions  digit;
  deci        digit;
  procedure init_digit is
  begin
  
    ones_digit(0) := '';
  
    ones_digit(1) := getMultiLang('BÝR', null, v_lang);
    if v_lang = 'GER' and length(absolutenumber) > 1 then
      ones_digit(1) := 'Ein';
    end if;
    ones_digit(2) := getMultiLang('ÝKÝ', null, v_lang);
    ones_digit(3) := getMultiLang('ÜÇ', null, v_lang);
    ones_digit(4) := getMultiLang('DÖRT', null, v_lang);
    ones_digit(5) := getMultiLang('BEÞ', null, v_lang);
    ones_digit(6) := getMultiLang('ALTI', null, v_lang);
    ones_digit(7) := getMultiLang('YEDÝ', null, v_lang);
    ones_digit(8) := getMultiLang('SEKÝZ', null, v_lang);
    ones_digit(9) := getMultiLang('DOKUZ', null, v_lang);
    if v_lang = 'GER' then
      for i in 0 .. 9 loop
        ones_digit(i) := lower(ones_digit(i));
      end loop;
    end if;
    if p_Using_Grouping = 'N' then
      exceptions(11) := replace(getMultiLang('ON BÝR', null, v_lang),
                                ' ',
                                null);
      exceptions(12) := replace(getMultiLang('ON ÝKÝ', null, v_lang),
                                ' ',
                                null);
      exceptions(13) := replace(getMultiLang('ON ÜÇ', null, v_lang),
                                ' ',
                                null);
      exceptions(14) := replace(getMultiLang('ON DÖRT', null, v_lang),
                                ' ',
                                null);
      exceptions(15) := replace(getMultiLang('ON BEÞ', null, v_lang),
                                ' ',
                                null);
      exceptions(16) := replace(getMultiLang('ON ALTI', null, v_lang),
                                ' ',
                                null);
      exceptions(17) := replace(getMultiLang('ON YEDÝ', null, v_lang),
                                ' ',
                                null);
      exceptions(18) := replace(getMultiLang('ON SEKÝZ', null, v_lang),
                                ' ',
                                null);
      exceptions(19) := replace(getMultiLang('ON DOKUZ', null, v_lang),
                                ' ',
                                null);
    else
      exceptions(11) := getMultiLang('ON BÝR', null, v_lang);
      exceptions(12) := getMultiLang('ON ÝKÝ', null, v_lang);
      exceptions(13) := getMultiLang('ON ÜÇ', null, v_lang);
      exceptions(14) := getMultiLang('ON DÖRT', null, v_lang);
      exceptions(15) := getMultiLang('ON BEÞ', null, v_lang);
      exceptions(16) := getMultiLang('ON ALTI', null, v_lang);
      exceptions(17) := getMultiLang('ON YEDÝ', null, v_lang);
      exceptions(18) := getMultiLang('ON SEKÝZ', null, v_lang);
      exceptions(19) := getMultiLang('ON DOKUZ', null, v_lang);
    end if;
    if v_lang = 'GER' then
      for i in 11 .. 19 loop
        exceptions(i) := lower(exceptions(i));
      end loop;
    end if;
    tens_digit(0) := '';
    tens_digit(1) := getMultiLang('ON', null, v_lang);
    tens_digit(2) := getMultiLang('YÝRMÝ', null, v_lang);
    tens_digit(3) := getMultiLang('OTUZ', null, v_lang);
    tens_digit(4) := getMultiLang('KIRK', null, v_lang);
    tens_digit(5) := getMultiLang('ELLÝ', null, v_lang);
    tens_digit(6) := getMultiLang('ALTMIÞ', null, v_lang);
    tens_digit(7) := getMultiLang('YETMÝÞ', null, v_lang);
    tens_digit(8) := getMultiLang('SEKSEN', null, v_lang);
    tens_digit(9) := getMultiLang('DOKSAN', null, v_lang);
    if v_lang = 'GER' then
      for i in 0 .. 9 loop
        tens_digit(i) := lower(tens_digit(i));
      end loop;
    end if;
    upper_digit(0) := '';
    upper_digit(1) := getMultiLang('YÜZ', null, v_lang);
    upper_digit(2) := getMultiLang('BÝN', null, v_lang);
    upper_digit(3) := getMultiLang('MÝLYON', null, v_lang);
    upper_digit(4) := getMultiLang('MÝLYAR', null, v_lang);
    upper_digit(5) := getMultiLang('TRÝLYON', null, v_lang);
    upper_digit(6) := getMultiLang('KATRÝLYON', null, v_lang);
    upper_digit(7) := getMultiLang('KENTÝLYON', null, v_lang);
    upper_digit(8) := getMultiLang('SEKSÝLYON', null, v_lang);
    upper_digit(9) := getMultiLang('SEPTÝLYON', null, v_lang);
    if v_lang = 'GER' then
      --Bis Eine Million wird es klein geschrieben
      for i in 1 .. 9 loop
        if i < 3 then
          upper_digit(i) := lower(upper_digit(i));
        else
          upper_digit(i) := ' ' || upper_digit(i) || ' ';
        end if;
      end loop;
    end if;
    deci(0) := '';
    deci(1) := getMultiLang('ONDA', null, v_lang);
    deci(2) := getMultiLang('YÜZDE', null, v_lang);
    deci(3) := getMultiLang('BÝNDE', null, v_lang);
    deci(4) := tens_digit(1) || getMultiLang('BÝNDE', null, v_lang);
    deci(5) := upper_digit(1) || getMultiLang('BÝNDE', null, v_lang);
    deci(6) := getMultiLang('MÝLYONDA', null, v_lang);
    deci(7) := tens_digit(1) || getMultiLang('MÝLYONDA', null, v_lang);
    deci(8) := upper_digit(1) || getMultiLang('MÝLYONDA', null, v_lang);
    deci(9) := getMultiLang('MÝLYARDA', null, v_lang);
    deci(10) := tens_digit(1) || getMultiLang('MÝLYARDA', null, v_lang);
    deci(11) := upper_digit(1) || getMultiLang('MÝLYARDA', null, v_lang);
    deci(12) := getMultiLang('TRÝLYONDA', null, v_lang);
    deci(13) := tens_digit(1) || getMultiLang('TRÝLYONDA', null, v_lang);
    deci(14) := upper_digit(1) || getMultiLang('TRÝLYONDA', null, v_lang);
    deci(15) := getMultiLang('KATRÝLYONDA', null, v_lang);
    deci(16) := tens_digit(1) || getMultiLang('KATRÝLYONDA', null, v_lang);
    deci(17) := upper_digit(1) || getMultiLang('KATRÝLYONDA', null, v_lang);
    deci(18) := getMultiLang('KENTÝLYONDA', null, v_lang);
    deci(19) := tens_digit(1) || getMultiLang('KENTÝLYONDA', null, v_lang);
    deci(20) := upper_digit(1) || getMultiLang('KENTÝLYONDA', null, v_lang);
    deci(21) := getMultiLang('SEKSÝLYONDA', null, v_lang);
    deci(22) := tens_digit(1) || getMultiLang('SEKSÝLYONDA', null, v_lang);
    deci(23) := upper_digit(1) || getMultiLang('SEKSÝLYONDA', null, v_lang);
    deci(24) := getMultiLang('SEPTÝLYONDA', null, v_lang);
    deci(25) := tens_digit(1) || getMultiLang('SEPTÝLYONDA', null, v_lang);
    deci(26) := upper_digit(1) || getMultiLang('SEPTÝLYONDA', null, v_lang);
  
  end;
  function convert_number_to_char(numbertoconvert in number) return varchar2 is
    v_result        varchar2(500);
    numberStr       varchar2(500);
    numberlength    integer;
    groupcount      integer;
    currentgroup    integer;
    currentgroupstr varchar2(3);
    currentlength   integer;
    type digitstr is table of varchar2(100);
    digit digitstr;
  begin
  
    numberlength := length(to_char(numbertoconvert));
    groupcount   := ceil(numberlength / 3);
    currentgroup := 1;
    digit        := digitstr();
    while groupcount > 0 loop
      digit.extend(1);
    
      /*if currentgroup != 1 then
        numberStr := numberStr || ust_digit(currentgroup);
      end if;*/
      v_start := case
                   when length(to_char(numbertoconvert)) -
                        ((currentgroup * 3) - 1) < 0 then
                    0
                   else
                    length(to_char(numbertoconvert)) - ((currentgroup * 3) - 1)
                 end;
      v_length := case
                    when currentgroup * 3 < numberlength then
                     3
                    else
                     numberlength - ((currentgroup - 1) * 3)
                  end;
      currentgroupstr := substr(to_char(numbertoconvert), v_start, v_length);
      currentlength   := length(to_char(to_number(currentgroupstr)));
      currentgroupstr := to_char(to_number(currentgroupstr));
      if currentlength <= 3 then
        if currentlength < 2 and to_number(currentgroupstr) != 0 then
          --if v_lang !='GER' then
          numberStr := numberStr || ones_digit(to_number(currentgroupstr)) ||
                       v_Space;
          /*elsif numberlength>6 then
             numberStr := numberStr || ones_digit(to_number(currentgroupstr)) || ' ';
          else
            numberStr := numberStr || ones_digit(to_number(currentgroupstr)) || v_Space;
          end if; */
        end if;
        if currentlength = 2 then
          if to_number(substr(currentgroupstr, 1, 2)) between 11 and 19 then
            numberStr := numberStr ||
                         exceptions(to_number(substr(currentgroupstr, 1, 2))) ||
                         v_Space;
          else
            if v_lang = 'GER' then
              numberStr := numberStr ||
                           ones_digit(to_number(substr(currentgroupstr,
                                                       2,
                                                       1))) || v_Space;
              if mod(currentgroupstr, 10) = 0 then
                numberStr := numberStr ||
                             tens_digit(to_number(substr(currentgroupstr,
                                                         1,
                                                         1))) || v_Space;
              else
                numberStr := numberStr || 'und' ||
                             tens_digit(to_number(substr(currentgroupstr,
                                                         1,
                                                         1))) || v_Space;
              end if;
            else
              numberStr := numberStr ||
                           tens_digit(to_number(substr(currentgroupstr,
                                                       1,
                                                       1))) || v_Space;
            
              numberStr := numberStr ||
                           ones_digit(to_number(substr(currentgroupstr,
                                                       2,
                                                       1))) || v_Space;
            end if;
          end if;
        end if;
        if currentlength = 3 then
          if to_number(substr(currentgroupstr, 0, 1)) = 1 then
          
            numberStr := numberStr || upper_digit(1) || v_Space;
          end if;
          if to_number(substr(currentgroupstr, 0, 1)) != 1 then
          
            numberStr := numberStr ||
                         ones_digit(to_number(substr(currentgroupstr, 1, 1))) ||
                         v_Space;
            numberStr := numberStr || upper_digit(1) || v_Space;
          end if;
          if to_number(substr(currentgroupstr, 2, 2)) between 11 and 19 then
            numberStr := numberStr ||
                         exceptions(to_number(substr(currentgroupstr, 2, 2))) ||
                         v_Space;
          elsif v_lang = 'GER' then
            numberStr := numberStr ||
                         ones_digit(to_number(substr(currentgroupstr, 3, 1))) ||
                         v_Space;
            if mod(currentgroupstr, 10) = 0 then
              numberStr := numberStr ||
                           tens_digit(to_number(substr(currentgroupstr,
                                                       2,
                                                       1))) || v_Space;
            else
              numberStr := numberStr || 'und' ||
                           tens_digit(to_number(substr(currentgroupstr,
                                                       2,
                                                       1))) || v_Space;
            end if;
          else
            numberStr := numberStr ||
                         tens_digit(to_number(substr(currentgroupstr, 2, 1))) ||
                         v_Space;
            numberStr := numberStr ||
                         ones_digit(to_number(substr(currentgroupstr, 3, 1))) ||
                         v_Space;
          end if;
        end if;
      end if;
      digit(digit.count()) := numberStr;
      numberStr := '';
      currentgroup := currentgroup + 1;
      groupcount := groupcount - 1;
    end loop;
    for i in reverse 1 .. currentgroup - 1 loop
      if digit(i) is not null then
        if i = 2 and digit(i) = getMultiLang('BÝR', null, v_lang) then
          numberStr := numberStr || trim(upper_digit(i)) || v_Space;
        else
          if i = 1 then
            numberStr := numberStr || digit(i);
          elsif v_lang != 'GER' then
            numberStr := numberStr || digit(i) || trim(upper_digit(i)) ||
                         v_Space; --trim(upper_digit(i))
          else
            if digit(i) like 'ein%' and numberlength > 6 then
              digit(i) := 'eine';
            elsif numberlength > 6 and i > 2 then
              if substr(trim(upper_digit(i)), -1, 1) = 'e' then
                upper_digit(i) := ' ' || trim(upper_digit(i)) || 'n ';
              else
                upper_digit(i) := ' ' || trim(upper_digit(i)) || 'en ';
              end if;
            end if;
          
            numberStr := numberStr || digit(i) || (upper_digit(i)) ||
                         v_Space; --trim(upper_digit(i))
          end if;
        end if;
      end if;
    end loop;
    v_result := numberStr;
    return(v_result);
  end convert_number_to_char;

begin

  init_digit;
  case v_lang
    when 'TUR' then
      v_on_ek := false;
      v_Space := ' ';
    when 'ENG' then
      v_on_ek := true;
      v_Space := ' ';
    when 'GER' then
      v_on_ek := true;
      v_Space := '';
    else
      v_on_ek := true;
  end case;
  if p_Using_Grouping = 'N' then
    v_Space := null;
  end if;
  if instr(v_charNum, '.') != 0 then
    ctrl := 1;
    if v_lang != 'GER' then
      v_digit_grouping := '.';
    else
      v_digit_grouping := '';
    end if;
  end if;
  if ctrl = 0 and instr(v_charNum, ',') != 0 then
    if v_lang != 'GER' then
      v_digit_grouping := ',';
    else
      v_digit_grouping := '';
    end if;
  end if;

  decimalNumber  := mod(p_Number, 1);
  absolutenumber := p_Number - decimalNumber;
  init_digit;
  if p_Currency is not null then
    begin
      select getMultiLang(t.currency_name, null, p_lang),
             case
               when decimalNumber > 0 then
                case
                  when p_lang = 'TUR' then
                   t.decimal_name
                  else
                   case
                     when t.currency = 'TL' then
                      unicode_turkce_cevir(initcap(t.decimal_name), 'LATIN')
                     else
                      initcap(t.decimal_name)
                   end
                end
               else
                null
             end,
             t.decimal_digit
        into v_currency_name, v_decimal_name, v_decimal
        from currency_lookup_tbl t
       where t.currency = v_currency;
    exception
      when no_data_found then
        v_decimal      := 2;
        v_decimal_name := null;
    end;
  end if;

  if p_Currency is not null then
    ust             := v_decimal;
    decimalNumber   := round(decimalNumber, v_decimal);
    decimalNumber   := power(10, ust) * decimalNumber;
    v_decimal_Upper := 0;
  else
    ust             := length(to_char(decimalNumber)) - 1;
    decimalNumber   := power(10, ust) * decimalNumber;
    v_decimal_Upper := ust;
  end if;
  absoluenumberstr := convert_number_to_char(absolutenumber);
  if absolutenumber = 0 then
    v_Currency := null;
  elsif p_Currency is not null then
    v_Currency := case
                    when v_digit_grouping is null then
                     ' '
                    else
                     v_digit_grouping
                  end || v_Currency || case
                    when v_currency_name is null then
                     null
                    else
                     '-' || v_currency_name || ' '
                  end;
  end if;
  decimalNumberStr := convert_number_to_char(decimalNumber);
  v_result         := absoluenumberstr || v_Currency ||
                      deci(v_decimal_Upper) || v_Space || decimalNumberStr || ' ' ||
                      v_decimal_name;
  if v_on_ek then
    for i in 1 .. 9 loop
      if v_result like upper_digit(i) || '%' then
        v_result := ones_digit(1) || v_Space || v_result;
        exit;
      end if;
    end loop;
  end if;
  if v_lang not in ('GER', 'TUR') then
    v_result := upper(substr(v_result, 1, 1)) || substr(v_result, 2);
  end if;
  return(trim(v_result));
end Number2Text;
/
Prompt All Done
set feedback on
