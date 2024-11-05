set feedback off
set define off
prompt Installation of the GetMultiLang function and its dependencies
prompt created Sequence SEQ_MULTI_LANG_ID
create sequence SEQ_MULTI_LANG_ID
minvalue 0
maxvalue 9999999999
start with 13422
increment by 1
nocache
cycle
order;
prompt creating MULTI_LANG_TEXT_TBL
-- Create table
create table MULTI_LANG_TEXT_TBL
(
  pk_multi_lang_id NUMBER(10) not null,
  lang             VARCHAR2(30) not null,
  text             VARCHAR2(4000),
  op_id            VARCHAR2(128),
  op_date          DATE default sysdate
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
-- Create/Recreate primary, unique and foreign key constraints 
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

prompt Data inserting into MULTI_LANG_TEXT_TBL
insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10277, 'ENG', 'one', 'SENOL', to_date('08-09-2020 16:03:07', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10277, 'TUR', 'BÝR', 'SENOL', to_date('08-09-2020 16:03:07', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10277, 'GER', 'Eins', 'SENOL', to_date('08-09-2020 16:03:07', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10278, 'TUR', 'ÝKÝ', 'SENOL', to_date('08-09-2020 16:03:11', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10278, 'GER', 'Zwei', 'SENOL', to_date('08-09-2020 16:03:11', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10278, 'ENG', 'two', 'SENOL', to_date('08-09-2020 16:03:11', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10279, 'ENG', 'three', 'SENOL', to_date('08-09-2020 16:03:15', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10279, 'TUR', 'ÜÇ', 'SENOL', to_date('08-09-2020 16:03:15', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10279, 'GER', 'Drei', 'SENOL', to_date('08-09-2020 16:03:15', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10280, 'ENG', 'four', 'SENOL', to_date('08-09-2020 16:04:02', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10280, 'TUR', 'DÖRT', 'SENOL', to_date('08-09-2020 16:04:02', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10280, 'GER', 'Vier', 'SENOL', to_date('08-09-2020 16:04:02', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10281, 'TUR', 'BEÞ', 'SENOL', to_date('08-09-2020 16:04:05', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10281, 'GER', 'Fünf', 'SENOL', to_date('08-09-2020 16:04:05', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10281, 'ENG', 'five', 'SENOL', to_date('08-09-2020 16:04:05', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10282, 'GER', 'Sechs', 'SENOL', to_date('08-09-2020 16:04:09', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10282, 'ENG', 'six', 'SENOL', to_date('08-09-2020 16:04:09', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10282, 'TUR', 'ALTI', 'SENOL', to_date('08-09-2020 16:04:09', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10283, 'ENG', 'seven', 'SENOL', to_date('08-09-2020 16:04:12', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10283, 'GER', 'Sieben', 'SENOL', to_date('08-09-2020 16:04:12', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10283, 'TUR', 'YEDÝ', 'SENOL', to_date('08-09-2020 16:04:12', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10284, 'ENG', 'eigth', 'SENOL', to_date('08-09-2020 16:04:16', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10284, 'TUR', 'SEKÝZ', 'SENOL', to_date('08-09-2020 16:04:16', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10284, 'GER', 'Acht', 'SENOL', to_date('08-09-2020 16:04:16', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10285, 'GER', 'Neun', 'SENOL', to_date('08-09-2020 16:04:20', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10285, 'TUR', 'DOKUZ', 'SENOL', to_date('08-09-2020 16:04:20', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10285, 'ENG', 'nine', 'SENOL', to_date('08-09-2020 16:04:20', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10286, 'TUR', 'ON', 'SENOL', to_date('08-09-2020 16:04:25', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10286, 'GER', 'Zehn', 'SENOL', to_date('08-09-2020 16:04:25', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10286, 'ENG', 'ten', 'SENOL', to_date('08-09-2020 16:04:25', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10287, 'ENG', 'twenty', 'SENOL', to_date('08-09-2020 16:04:29', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10287, 'GER', 'Zwanzig', 'SENOL', to_date('08-09-2020 16:04:29', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10287, 'TUR', 'YÝRMÝ', 'SENOL', to_date('08-09-2020 16:04:29', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10288, 'GER', 'Dreißig', 'SENOL', to_date('08-09-2020 16:04:34', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10288, 'TUR', 'OTUZ', 'SENOL', to_date('08-09-2020 16:04:34', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10288, 'ENG', 'thirty', 'SENOL', to_date('08-09-2020 16:04:34', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10289, 'TUR', 'KIRK', 'SENOL', to_date('08-09-2020 16:04:39', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10289, 'GER', 'Vierzig', 'SENOL', to_date('08-09-2020 16:04:39', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10289, 'ENG', 'fourty', 'SENOL', to_date('08-09-2020 16:04:39', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10290, 'TUR', 'ELLÝ', 'SENOL', to_date('08-09-2020 16:04:44', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10290, 'GER', 'Fünfzig', 'SENOL', to_date('08-09-2020 16:04:44', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10290, 'ENG', 'fifty', 'SENOL', to_date('08-09-2020 16:04:44', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10291, 'ENG', 'sixty', 'SENOL', to_date('08-09-2020 16:04:48', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10291, 'GER', 'Sechszig', 'SENOL', to_date('08-09-2020 16:04:48', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10291, 'TUR', 'ALTMIÞ', 'SENOL', to_date('08-09-2020 16:04:48', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10292, 'ENG', 'seventy', 'SENOL', to_date('08-09-2020 16:04:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10292, 'TUR', 'YETMÝÞ', 'SENOL', to_date('08-09-2020 16:04:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10292, 'GER', 'Siebzig', 'SENOL', to_date('08-09-2020 16:04:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10293, 'GER', 'Achtzig', 'SENOL', to_date('08-09-2020 16:04:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10293, 'ENG', 'eigthy', 'SENOL', to_date('08-09-2020 16:04:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10293, 'TUR', 'SEKSEN', 'SENOL', to_date('08-09-2020 16:04:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10294, 'ENG', 'ninety', 'SENOL', to_date('08-09-2020 16:05:01', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10294, 'GER', 'Neunzig', 'SENOL', to_date('08-09-2020 16:05:01', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10294, 'TUR', 'DOKSAN', 'SENOL', to_date('08-09-2020 16:05:01', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10295, 'TUR', 'YÜZ', 'SENOL', to_date('08-09-2020 16:05:07', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10295, 'GER', 'hundert', 'SENOL', to_date('08-09-2020 16:05:07', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10295, 'ENG', 'hundred', 'SENOL', to_date('08-09-2020 16:05:07', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10296, 'ENG', 'two hundret', 'SENOL', to_date('08-09-2020 16:05:11', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10296, 'TUR', 'ÝKÝYÜZ', 'SENOL', to_date('08-09-2020 16:05:11', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10296, 'GER', 'Zweihundert', 'SENOL', to_date('08-09-2020 16:05:11', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10297, 'TUR', 'ÜÇYÜZ', 'SENOL', to_date('08-09-2020 16:05:15', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10297, 'GER', 'Dreihundert', 'SENOL', to_date('08-09-2020 16:05:15', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10297, 'ENG', 'three hundret', 'SENOL', to_date('08-09-2020 16:05:15', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10298, 'TUR', 'DÖRTYÜZ', 'SENOL', to_date('08-09-2020 16:05:20', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10298, 'GER', 'Vierhundert', 'SENOL', to_date('08-09-2020 16:05:20', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10298, 'ENG', 'four hundret', 'SENOL', to_date('08-09-2020 16:05:20', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10299, 'TUR', 'BEÞYÜZ', 'SENOL', to_date('08-09-2020 16:05:24', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10299, 'ENG', 'five hundret', 'SENOL', to_date('08-09-2020 16:05:24', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10299, 'GER', 'Fünfhundert', 'SENOL', to_date('08-09-2020 16:05:24', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10300, 'GER', 'Sechshundert', 'SENOL', to_date('08-09-2020 16:05:28', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10300, 'ENG', 'six hundret', 'SENOL', to_date('08-09-2020 16:05:28', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10300, 'TUR', 'ALTIYÜZ', 'SENOL', to_date('08-09-2020 16:05:28', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10301, 'ENG', 'seven hundret', 'SENOL', to_date('08-09-2020 16:05:32', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10301, 'GER', 'Siebenhundert', 'SENOL', to_date('08-09-2020 16:05:32', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10301, 'TUR', 'YEDÝYÜZ', 'SENOL', to_date('08-09-2020 16:05:32', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10302, 'GER', 'Achthundert', 'SENOL', to_date('08-09-2020 16:05:37', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10302, 'TUR', 'SEKÝZYÜZ', 'SENOL', to_date('08-09-2020 16:05:37', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10302, 'ENG', 'eigth hundret', 'SENOL', to_date('08-09-2020 16:05:37', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10303, 'GER', 'Neunhundert', 'SENOL', to_date('08-09-2020 16:05:41', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10303, 'TUR', 'DOKUZYÜZ', 'SENOL', to_date('08-09-2020 16:05:41', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10303, 'ENG', 'nine hundret', 'SENOL', to_date('08-09-2020 16:05:41', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10304, 'ENG', 'thousand', 'SENOL', to_date('08-09-2020 16:06:30', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10304, 'TUR', 'BÝN', 'SENOL', to_date('08-09-2020 16:06:30', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10304, 'GER', 'Tausend', 'SENOL', to_date('08-09-2020 16:06:30', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10305, 'ENG', 'million', 'SENOL', to_date('08-09-2020 16:06:39', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10305, 'TUR', 'MÝLYON', 'SENOL', to_date('08-09-2020 16:06:39', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10305, 'GER', 'Million', 'SENOL', to_date('08-09-2020 16:06:39', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10306, 'TUR', 'MÝLYAR', 'SENOL', to_date('08-09-2020 16:06:49', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10306, 'ENG', 'billion', 'SENOL', to_date('08-09-2020 16:06:49', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10306, 'GER', 'Milliarde', 'SENOL', to_date('08-09-2020 16:06:49', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10336, 'GER', 'elf', 'SENOL', to_date('10-09-2020 16:09:03', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10336, 'ENG', 'eleven', 'SENOL', to_date('10-09-2020 16:09:03', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10336, 'TUR', 'ON BÝR', 'SENOL', to_date('10-09-2020 16:09:03', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10337, 'TUR', 'ON ÝKÝ', 'SENOL', to_date('10-09-2020 16:09:12', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10337, 'ENG', 'twelve', 'SENOL', to_date('10-09-2020 16:09:12', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10337, 'GER', 'zwölf', 'SENOL', to_date('10-09-2020 16:09:12', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10338, 'GER', 'dreizehn', 'SENOL', to_date('10-09-2020 16:09:18', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10338, 'ENG', 'thirteen', 'SENOL', to_date('10-09-2020 16:09:18', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10338, 'TUR', 'ON ÜÇ', 'SENOL', to_date('10-09-2020 16:09:18', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10339, 'ENG', 'fourteen', 'SENOL', to_date('10-09-2020 16:09:25', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10339, 'TUR', 'ON DÖRT', 'SENOL', to_date('10-09-2020 16:09:25', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10339, 'GER', 'vierzehn', 'SENOL', to_date('10-09-2020 16:09:25', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10340, 'ENG', 'fifteen', 'SENOL', to_date('10-09-2020 16:09:33', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10340, 'GER', 'fünfzehn', 'SENOL', to_date('10-09-2020 16:09:33', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10340, 'TUR', 'ON BEÞ', 'SENOL', to_date('10-09-2020 16:09:33', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10341, 'ENG', 'sixteen', 'SENOL', to_date('10-09-2020 16:09:40', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10341, 'GER', 'sechszehn', 'SENOL', to_date('10-09-2020 16:09:40', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10341, 'TUR', 'ON ALTI', 'SENOL', to_date('10-09-2020 16:09:40', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10342, 'TUR', 'ON YEDÝ', 'SENOL', to_date('10-09-2020 16:09:47', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10342, 'GER', 'siebzehn', 'SENOL', to_date('10-09-2020 16:09:47', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10342, 'ENG', 'seventeen', 'SENOL', to_date('10-09-2020 16:09:47', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10343, 'ENG', 'eighteen', 'SENOL', to_date('10-09-2020 16:09:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10343, 'TUR', 'ON SEKÝZ', 'SENOL', to_date('10-09-2020 16:09:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10343, 'GER', 'achtzehn', 'SENOL', to_date('10-09-2020 16:09:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10344, 'GER', 'neunzehn', 'SENOL', to_date('10-09-2020 16:10:03', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10344, 'TUR', 'ON DOKUZ', 'SENOL', to_date('10-09-2020 16:10:03', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10344, 'ENG', 'nineteen', 'SENOL', to_date('10-09-2020 16:10:03', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10357, 'TUR', 'TRÝLYON', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10357, 'ENG', 'trillion', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10357, 'GER', 'Billion', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10358, 'TUR', 'KATRÝLYON', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10358, 'GER', 'Billiarde', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10358, 'ENG', 'quadrillion', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10359, 'ENG', 'quintillion', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10359, 'GER', 'Trillion', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10359, 'TUR', 'KENTÝLYON', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10360, 'ENG', 'sexion', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10360, 'TUR', 'SEKSÝLYON', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10360, 'GER', 'Sexion', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10361, 'ENG', 'septillion', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10361, 'TUR', 'SEPTÝLYON', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10361, 'GER', 'Septillion', 'SENOL', to_date('11-09-2020 15:01:53', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10362, 'GER', 'PROZENTSATZ', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10362, 'TUR', 'YÜZDE', 'SENOL', to_date('27-04-2022 15:32:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10362, 'ENG', 'PERCENTAGE', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10363, 'ENG', 'per thousand', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10363, 'TUR', 'BÝNDE', 'SENOL', to_date('27-04-2022 15:32:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10363, 'GER', 'pro tausend', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10364, 'GER', 'PRO MILLION', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10364, 'TUR', 'MÝLYONDA', 'SENOL', to_date('27-04-2022 15:32:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10364, 'ENG', 'PER MILLION', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10365, 'GER', 'IN MILLIARDEN', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10365, 'TUR', 'MÝLYARDA', 'SENOL', to_date('27-04-2022 15:32:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10365, 'ENG', 'IN BILLION', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10366, 'GER', 'IN BILLIONEN', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10366, 'ENG', 'IN TRILLION', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10366, 'TUR', 'TRÝLYONDA', 'SENOL', to_date('27-04-2022 15:32:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10367, 'GER', 'QUATRILION', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10367, 'TUR', 'KATRÝLYONDA', 'SENOL', to_date('27-04-2022 15:32:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10367, 'ENG', 'QUATRILION', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10368, 'GER', 'IN ZENTILLIONEN', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10368, 'TUR', 'KENTÝLYONDA', 'SENOL', to_date('27-04-2022 15:32:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10368, 'ENG', 'IN CENTILLION', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10369, 'ENG', 'IN SEXILLION', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10369, 'GER', 'in Sexillion', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10369, 'TUR', 'SEKSÝLYONDA', 'SENOL', to_date('27-04-2022 15:32:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10370, 'GER', 'IN DER SEPTILLION', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10370, 'TUR', 'SEPTÝLYONDA', 'SENOL', to_date('27-04-2022 15:32:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10370, 'ENG', 'IN THE SEPTILLION', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10371, 'ENG', 'Türkish Lira', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10371, 'GER', 'Türkische Lira', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10371, 'TUR', 'TÜRK LÝRASI', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10372, 'ENG', 'US Dollar', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10372, 'GER', 'US-Dollar', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10372, 'TUR', 'ABD DOLARI', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10373, 'ENG', 'Euro', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10373, 'GER', 'Euro', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10373, 'TUR', 'AVRO', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10374, 'ENG', 'Pound Sterling', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10374, 'GER', 'Pfund Sterling', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (10374, 'TUR', 'STERLIN', 'SENOL', to_date('27-04-2022 15:33:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (13419, 'ENG', 'Tenths', 'SENOL', to_date('10-09-2020 16:09:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (13419, 'TUR', 'ONDA', 'SENOL', to_date('10-09-2020 16:09:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (13419, 'GER', 'Zehntel', 'SENOL', to_date('10-09-2020 16:09:12', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (13420, 'ENG', 'Yes', 'SENOL', to_date('10-09-2020 16:09:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (13420, 'TUR', 'Evet', 'SENOL', to_date('10-09-2020 16:09:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (13420, 'GER', 'Ja', 'SENOL', to_date('10-09-2020 16:09:12', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (13421, 'ENG', 'No', 'SENOL', to_date('10-09-2020 16:09:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (13421, 'TUR', 'Hayýr', 'SENOL', to_date('10-09-2020 16:09:57', 'dd-mm-yyyy hh24:mi:ss'));

insert into MULTI_LANG_TEXT_TBL (PK_MULTI_LANG_ID, LANG, TEXT, OP_ID, OP_DATE)
values (13421, 'GER', 'Nein', 'SENOL', to_date('10-09-2020 16:09:12', 'dd-mm-yyyy hh24:mi:ss'));

prompt Data inserting into MULTI_LANG_TEXT_TBL
create or replace function getMultiLang(p_Description in varchar2,
                                        p_opid        in varchar2 := null,
                                        p_lang        in varchar2 := null)
  return varchar2 is
  pragma autonomous_transaction;

  /* 
      Purpose:
      Ger: Konventionelle Übersetzung aus vordefinierter Tabelle multi_lang_text_tbl
           Hinweis : Wenn Ihr Text nicht in der Tabelle gefunden wird, wird automatisch Erstellt.
                     So können Sie ihn später korrekt ausfüllen
      Eng: Conventional translation from predefined table multi_lang_text_tbl
           Notice : If your text is not found in the table, the text will be inserted automatically. 
                    So you can fill it in correctly later
      Tur: Önceden tanýmlanmýþ multi_lang_text_tbl tablosundan geleneksel tercüme
           Uyarý : Metniniz tabloda bulunmazsa, metin otomatik olarak eklenecektir. 
                   Böylece daha sonra doðru þekilde doldurabilirsiniz.
      p_Description : text to be translated
      p_Opid        : Username
      p_Lang        : Target Language, <ENG>lish / <GER>man / <TUR>kish
      Example :
      1-
      p_Description => 'Milyar' (Türkish)
      p_Opid        => 'SENOL'
      p_Lang        => 'GER' --Target language
      
      Result for GER =>  Milliarde
             for ENG =>  billion  
      2-
      p_Description => 'No' (English)
      p_Opid        => 'SENOL'
      p_Lang        => 'GER' --Target language
      
      Result for GER =>  Nein
             for TUR =>  Hayýr
  
      Change Log
      Date        By Whom               Description
      ----------  --------------------- --------------------------------------------------------------
      01.08.2019  Senol YILMAZ          Created
    
  */
  v_lang        varchar2(30);
  v_id          number(10);
  v_Description varchar2(32767) := p_Description;
  d_lang        varchar2(30) := coalesce(p_lang, 'ENG'); --<ENG>lish / <GER>man / <TUR>kish
  d_opid        varchar2(128) := coalesce(p_opid, user);

begin
  begin
    if v_lang != d_lang then
      select t.pk_multi_lang_id, lang
        into v_id, v_lang
        from multi_lang_text_tbl t
       where t.text = p_Description;
    
      select t.text
        into v_Description
        from multi_lang_text_tbl t
       where t.pk_multi_lang_id = v_id
         and t.lang = d_Lang;
    else
      v_Description := p_Description;
    end if;
    return v_Description;
  exception
    when no_data_found then
      if v_Description is not null then
        begin
          insert into multi_lang_text_tbl
            (pk_multi_lang_id, lang, text, op_id, op_date)
          values
            (SEQ_Multi_Lang_Id.Nextval,
             coalesce(p_lang, d_lang),
             SUBSTR(v_Description, 1, 4000),
             d_opid,
             sysdate);
        exception
          when others then
            null;
        end;
      end if;
      commit;
      return v_Description;
    when too_many_rows then
      return v_Description;
  end;
  commit;
end;
/
prompt Installation Done.
