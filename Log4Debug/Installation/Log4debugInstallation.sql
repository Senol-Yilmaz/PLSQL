-- Create table
create table LOG4DEBUG_TBL
(
  pk_log4debug_id NUMBER(12) generated always as identity,
  op_id           VARCHAR2(128 CHAR),
  op_date         DATE,
  log_desc       VARCHAR2(4000 CHAR),
  log_debug       CLOB,
  wcm_owner       VARCHAR2(128),
  wcm_name        VARCHAR2(1000),
  wcm_lineno      NUMBER,
  wcm_caller_t    VARCHAR2(4000),
  current_object  VARCHAR2(200),
  parent_object   VARCHAR2(200),
  path            VARCHAR2(4000)
)
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 10M
    next 2M
    minextents 1
    maxextents unlimited
  );

create table DEBUG_MONITOR_TBL
(
  owner         VARCHAR2(128) not null,
  object_name   VARCHAR2(256) not null,
  debug_enabled VARCHAR2(1),
  op_id         VARCHAR2(128),
  op_date       DATE default sysdate
)
tablespace AVSA_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 5M
    next 504K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table DEBUG_MONITOR_TBL
  add constraint PK_DEBUG_MONITOR primary key (OWNER, OBJECT_NAME)
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
-- Create/Recreate check constraints 
alter table DEBUG_MONITOR_TBL
  add constraint CH_DEBUG_MON_CHK
  check (DEBUG_ENABLED in ('Y','N'));


create or replace procedure log4debug(p_Log_Debug   clob := null,
                                      p_Description in varchar2 := null,
                                      p_Truncate    in integer := null) is
  pragma autonomous_transaction;
  /* 
    Purpose:
    Logging any data from Sp/Trigger for debugging purposes
    How to use:
    p_Log_Debug       => Put your logging data
    p_Description     => Description of your logging data
    p_Truncate        => Truncating table log4Debug_tbl 
                 p_Truncate null ---> Let as is
                 1    ---> was truncated at the beginning 
                 2    ---> Don't truncate, Custom log 4 Debugging <Y>es , set the value from apex app on login page-> pre rendering -> set_debug, item :p0_debug
                 3    ---> Don't truncate, Custom log 4 Debugging <N>o, set the value from apex app on login page-> pre rendering -> set_debug, item :p0_debug
  
    example : log4debug( 'line:'||$$plsql_line||' put any variable and data, text','Debugging HR Package  for salary calculation');
  
    Change Log
    Date        By Whom               Description
    ----------  --------------------- --------------------------------------------------------------
    26.03.2024  Senol YILMAZ          Created
  
  */

  v_opid          varchar2(128);
  v_opDate        date;
  v_wcm_owner     varchar2(128);
  v_wcm_name      varchar2(1000);
  v_wcm_lineno    number;
  v_wcm_caller_t  varchar2(4000);
  v_debug_enabled varchar2(1);
  --v_real_client_id varchar2(65);
  v_host        varchar2(128);
  v_module      varchar2(256);
  v_action      varchar2(256);
  v_call_stack  varchar2(4000);
  v_current_obj varchar2(400);
  v_parent_obj  varchar2(200);
  v_path        varchar2(2000);
  v_table       varchar2(100);
  function get_prosedure(p_owner in varchar2,
                         p_name  in varchar2,
                         p_line  in integer) return varchar2 is
    v_value varchar2(4000);
  Begin
    for r in (select *
                from all_source t
               where t.owner = p_owner
                 and t.name = p_name
                 and t.line <= p_line
               order by line desc) loop
      if upper(r.text) like '%PROCEDURE%' or
         upper(r.text) like '%FUNCTION%' then
        v_value := r.text;
        exit;
      end if;
    end loop;
    return v_value;
  End;

  function get_debug return varchar2 is
  begin
    if v_wcm_owner is not null and v_wcm_name is not null then
      select debug_enabled
        into v_debug_enabled
        from debug_monitor_tbl t
       where owner = v_wcm_owner
         and object_name = v_wcm_name
         and rownum = 1;
    else
      if coalesce(p_Truncate, 2) = 2 then
        v_debug_enabled := 'Y';
      elsif p_truncate = 3 then
        v_debug_enabled := 'N';
      end if;
    end if;
    return v_debug_enabled;
  exception
    when no_data_found then
    
      return 'Y'; --<N>o Debug Disabled
  end;

  procedure extraction(P_text    in varchar2,
                       p_module  in varchar2,
                       p_current out varchar2,
                       p_parent  out varchar2,
                       p_path    out varchar2,
                       p_type    in varchar2 := null) is
    v_text       varchar2(4000) := p_text;
    v_result     varchar2(4000);
    v_current    varchar2(4000);
    v_line       integer;
    v_par_line   integer;
    v_num        varchar2(40);
    v_name       varchar2(1000);
    flg          boolean := true;
    flg1         boolean := true;
    kon          integer;
    v_pf         varchar2(1);
    v_parent     varchar2(2000);
    v_parent_sub varchar2(2000);
    v_sub_proc   varchar2(2000);
    function extraction(p_text in varchar2) return varchar2 is
      v_result varchar2(4000);
    Begin
      if p_text like '%PROCEDURE%' then
        v_result := substr(p_text, instr(p_text, 'PROCEDURE') + 9);
        v_result := trim(substr(v_result, 1, instr(v_result, '(') - 1));
      elsif p_text like '%FUNCTION%' then
        v_result := substr(p_text, instr(p_text, 'FUNCTION') + 9);
        v_result := trim(substr(v_result, 1, instr(v_result, '(') - 1));
      elsif instr(p_text, '(') != 0 and flg then
        v_result := trim(substr(p_text, 1, instr(p_text, '(') - 1));
      end if;
      if p_type is not null and v_result = P_type then
        return initcap(v_result) || ' (Table)';
      else
        return initcap(v_result);
      end if;
    End;
  
    function is_number(xn in varchar2) return integer deterministic is
      xx number;
    Begin
      select to_number(xn) into xx from dual;
      return 1;
    exception
      when others then
        return 0;
    End;
  
  Begin
    v_text := replace(v_text, chr(10), ',');
    for t in (with rws as
                 (select v_text str from dual)
                select sira, value
                  from (select rownum sira,
                               regexp_substr(str, '[^,]+', 1, level) value
                          from rws
                        connect by level <=
                                   length(str) - length(replace(str, ',')) + 1)
                 where sira > 3
                 order by 1 desc) loop
    
      v_num  := (trim(substr(t.value, 12, 10)));
      v_name := trim(replace(replace(replace(substr(t.value, 24),
                                             'package body '),
                                     'procedure '),
                             'function '));
      if v_name like USER || '.DML_%' then
        v_pf := 'T';
      else
        v_pf := case
                  when t.value like '%procedure %' then
                   'P'
                  when t.value like '%function %' then
                   'F'
                  when t.value like '%anonymous block%' then
                   'A'
                  else
                   'X'
                end;
        -----Eng:To determine the existing logging tables and objects
        -----Ger:So ermitteln Sie die vorhandenen Protokolltabellen und -objekte
        -----Tur:Mevcut günlük tablolarýný ve nesnelerini belirlemek için
      
        -----Set your own code
        v_pf := case
                  when t.value like '%_LOG%' or
                       t.value like '%' || user || '.LOG4DEBUG%' or
                       t.value like '%GUI.XML_PKG%' then
                   'L'
                  else
                   v_pf
                end;
      end if;
      if v_pf in ('T', 'L') then
        v_name       := null;
        v_num        := null;
        v_parent_sub := null;
      end if;
      if v_pf = 'X' and not is_number(v_num) = 0 then
      
        v_line := to_number(v_num);
        dbms_output.put_line(v_line || '****' || v_name);
      
        for r in (select t.line, upper(t.text) text, t.name
                    from all_source t
                   where t.owner = substr(v_name, 1, instr(v_name, '.') - 1)
                     and t.name = substr(v_name, instr(v_name, '.') + 1)
                     and t.line <= v_line
                     and t.type = 'PACKAGE BODY'
                   order by t.line desc) loop
        
          if r.text like '%PROCEDURE%' or r.text like '%FUNCTION%' or
             r.text like '%TRIGGER%' then
          
            v_parent_sub := extraction(r.text);
            Begin
              select 1
                into kon
                from all_procedures p
               where p.owner = substr(v_name, 1, instr(v_name, '.') - 1)
                 and p.object_name = substr(v_name, instr(v_name, '.') + 1)
                 and p.PROCEDURE_NAME = upper(v_parent_sub)
                 and rownum = 1;
            
              v_par_line := v_line;
              if v_parent_sub is not null then
                v_parent_sub := case
                                  when coalesce(replace(v_result, 'anonymous block', null), '#') != '#' then
                                   v_result || '->'
                                  else
                                   null
                                end || initcap(r.name) || '.' ||
                                v_parent_sub;
                dbms_output.put_line(v_current || case when
                                     v_parent_sub is not null then
                                     '-' || v_parent_sub else null end);
                exit;
              end if;
            exception
              when no_data_found then
                v_sub_proc := v_parent_sub;
            end;
          end if;
        
        end loop;
        if v_pf = 'X' and
           coalesce(v_parent, '½') not like '%' || v_parent_sub || '%' then
          v_parent   := case
                          when v_parent is not null then
                           v_parent || '->'
                          else
                           null
                        end || v_parent_Sub || case
                          when v_sub_proc is not null then
                           '->' || v_sub_proc || ' (Sub Proc)'
                          else
                           null
                        end;
          v_sub_proc := null;
        end if;
      elsif v_pf in ('F', 'P') then
        v_current := initcap(v_name) || ' (' || case v_pf
                       when 'F' then
                        'Function'
                       else
                        'Procedure'
                     end || ')';
      elsif v_pf = 'A' and flg1 then
        v_parent_Sub := case
                          when v_parent_Sub is not null then
                           v_parent_sub || '->'
                          else
                           null
                        end || 'anonymous block';
        v_result     := v_parent_sub;
        flg1         := false;
      elsif v_pf = 'T' and
            coalesce(v_parent, '½') not like '%' || initcap(v_name) || '%' then
        v_current    := initcap(v_name) || ' (Trigger)';
        v_parent_sub := case
                          when v_parent is not null then
                           v_parent || '->'
                          else
                           null
                        end || v_current;
      
      end if;
    End loop;
    if v_parent not like '%anonymous block%' and v_parent is not null and
       v_current is null then
      p_current := v_parent;
      p_parent  := null;
    else
      p_current := v_current;
      if v_parent not like '%anonymous block%' then
        p_parent := case
                      when v_parent is not null and
                           coalesce(p_parent, '½') not like '%' || v_parent || '%' then
                       v_parent
                      else
                       null
                    end || case
                      when v_parent_sub is not null then
                       '->' || v_parent_sub
                      else
                       null
                    end;
      else
        p_parent := null;
      end if;
    end if;
    p_path := case
                when p_module = 'PL/SQL Developer' then
                 p_module || '->'
                when p_module is not null then
                 substr(p_module, 1, instr(p_module, ' ') - 1) || '->'
                else
                 null
              end || case
                when p_module is not null and
                     p_parent like '%anonymous block%' then
                 null
                else
                 p_parent
              end || case
                when v_par_line is not null and p_parent is not null then
                 ' (Line:' || v_par_line || ')'
                else
                 null
              end || case
                when p_Parent is not null then
                 '->'
                else
                 null
              end || case
                when p_current is not null then
                 p_current
                else
                 null
              end;
  End;

begin
  owa_util.who_called_me(v_wcm_owner,
                         v_wcm_name,
                         v_wcm_lineno,
                         v_wcm_caller_t);
  sys.dbms_application_info.read_module(module_name => v_MODULE,
                                        action_name => v_action);

  v_opDate       := sysdate;
  v_wcm_caller_t := case
                      when v_wcm_caller_t like USER || '.DML_%' then
                       'TRIGGER'
                      else
                       v_wcm_caller_t
                    end;
  v_table := case
               when p_log_debug like 'DML=>%' then
                p_Description
               else
                null
             end;
  v_wcm_name := case
                  when p_log_debug like 'DML=>%' then
                   substr(p_Description, instr(p_Description, '.') + 1) ||
                   ' (Table)'
                  else
                   v_wcm_name
                end;
  v_wcm_owner := case
                   when p_log_debug like 'DML=>%' then
                    substr(p_Description, 1, instr(p_Description, '.') - 1)
                   else
                    v_wcm_owner
                 end;
  if p_Truncate = 1 then
    execute immediate 'truncate table log4Debug_tbl';
  end if;
  if coalesce(p_Truncate, 0) != -1 then
    if get_debug = 'Y' then
    
      Begin
        /*If necessary, you should write your own routine that obtains the user name (opid=>Operation Id) */
        select sys_context('userenv', 'IP_ADDRESS') into v_host from dual;
        v_opid := user || '.' || substr(v_host, 1, 128);
      
      exception
        when no_Data_Found then
          v_opid := coalesce(global_pkg.xust_menu_kod, user);
      End;
      v_call_stack := dbms_utility.format_call_stack;
      extraction(v_call_stack,
                 case when v_module is null and v_action is null then null else
                 v_module end,
                 v_current_obj,
                 v_parent_obj,
                 v_path,
                 v_table);
      insert into log4debug_tbl
        (log_desc,
         log_debug,
         op_id,
         op_date,
         wcm_owner,
         wcm_name,
         wcm_lineno,
         wcm_caller_t,
         current_object,
         parent_object,
         path)
      values
        (case when v_module is null and v_action is null then null else
         v_module || '-' || v_action || chr(10)
         end || p_Description || chr(10) || 'Log4Debug Info:' || case when
         p_Truncate is null then 'Let log4debug_tbl as is.' when
         p_Truncate = 1 then
         'log4debug_tbl was truncated at the beginning.' else
         to_char(p_truncate) end || chr(10) || v_call_stack || chr(10),
         case when v_table is not null then v_table || ' ' else null
         end || p_Log_Debug,
         v_opid,
         v_opDate,
         case when v_table is not null then
         substr(v_table, 1, instr(v_table, '.') - 1) else v_wcm_owner end,
         case when v_table is not null then
         substr(v_table, instr(v_table, '.') + 1) else v_wcm_name end,
         v_wcm_lineno,
         v_wcm_caller_t,
         substr(v_current_obj, 1, 200),
         v_parent_obj,
         case when v_module is null and v_action is null then null else
         v_module || '-' || v_action || v_path end);
      commit;
    end if;
  end if;
end;
