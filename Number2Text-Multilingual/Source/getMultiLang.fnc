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
