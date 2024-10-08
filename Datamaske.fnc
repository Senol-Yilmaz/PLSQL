create or replace function Datamaske (p_Wert in varchar2,p_Maske in varchar2,p_Oracle_maske_JN in varchar2:='N',p_typ in varchar2:=null) return varchar2 is
  v_Wert varchar2(4000) :=p_wert;
  v_Datamaske varchar2(4000);
  v_chr varchar2(1);
  v_datum date;
  v_Nummer number;
  v_laenge integer:=0;
begin
  if p_Oracle_maske_JN = 'N' then
  for i in 1..length(p_Maske)
    loop
      if substr(p_maske,i,1) = 'X' then
       v_laenge := v_Laenge + 1;
       v_chr :=substr(v_Wert,v_laenge,1);
      else
      v_chr :=substr(p_maske,i,1);  
      end if;
      if i=1 then
      v_Datamaske := v_chr;
      else
       v_Datamaske := v_Datamaske ||v_chr; 
      end if;
    end loop;
   elsif p_Typ='N' then
     v_Datamaske := to_char(to_number(p_wert),p_Maske);
   elsif p_Typ = 'D' then
    select to_date(p_wert) into v_datum from dual;
    select to_char(v_Datum,p_maske) into v_Datamaske from dual;
   elsif p_Typ = 'N' then
    select to_number(p_wert) into v_nummer from dual; 
    select to_char(v_nummer,p_Maske) into v_Datamaske from dual;
   else
     return p_wert;
   end if;
  return(v_Datamaske);
  
end Datamaske ;
/
