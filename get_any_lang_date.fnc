create or replace function get_any_lang_date(p_Date   in date := sysdate,
                                             p_Lang   in varchar2 := 'English',
                                             p_format in varchar2 := 'Day,dd.Mon.YYYY')
/* 
    Purpose:
    Getting Date text in any language with regular Date format
    How to use:
    p_Date            => Date value, if nul default is sysdate
    p_Lang            => Regular Language Text
    p_Format          => Regular Format
       
    Example : p_Date => 08.10.2024 p_Lang =>'English' p_Format => 'Day,dd.Mon.YYYY' result 'Tuesday  ,08.Oct.2024'
    Change Log
    Date        By Whom               Description
    ----------  --------------------- --------------------------------------------------------------
    12.04.2016  Senol YILMAZ          Created
  
  */
 return varchar2 is
  v_Date_Text varchar2(100);
begin

  WITH nls AS
   (SELECT 'NLS_DATE_LANGUAGE = ''' || p_lang || '''' nvalue FROM dual)
  SELECT TO_CHAR(p_Date, p_format, nls.nvalue) date_from
    into v_Date_Text
    FROM nls;

  return(v_Date_Text);
end;
/
