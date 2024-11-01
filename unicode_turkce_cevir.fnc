create or replace function unicode_turkce_cevir(p_text in varchar2,
                                                p_type in varchar2 := 'UNICODE')
  return varchar2 deterministic is
  /* 
      Purpose:
      For Türkish language, converting Türkish Characters to Unicode characters or Latin Characters
      For example Şenol Yılmaz => &#350;enol Y&#305;lmaz
  
      How to use:
      p_text         => Text
      p_type           => Type, default "UNICODE" / INVUNICODE from Unicode to Real, LATIN from Türkish to Latin (oneway)
    
      Change Log
      Date        By Whom               Description
      ----------  --------------------- --------------------------------------------------------------
      23.06.2017  Senol YILMAZ          Created
      30.10.2024  Senol YILMAZ          Adding Function for Latin, Real to Latin
  */
  v_value        varchar2(32767) := p_text;
  v_Rest         varchar2(50) := 'ğ~Ğ~ı~İ~ö~Ö~ü~Ü~ş~Ş~ç~Ç~';
  v_target       varchar2(400) := '&#287;~&#286;~&#305;~&#304;~&#246;~&#214;~&#252;~&#220;~&#351;~&#350;~&#231;~&#199;~';
  v_target_latin varchar2(400) := 'g~G~i~I~o~O~u~U~s~S~c~C~';
  v_Source       varchar2(5);
  v_unicode      varchar2(6);
  --Get Rest text
  function rest(p_rest in out varchar2, p_sep in varchar2 := '~')
    return varchar2 deterministic is
    xValue varchar2(4000);
    xStart integer;
  
  begin
    xStart := instr(p_rest, p_sep, 1, 1);
    if xStart != 0 then
      xValue := substr(p_rest, 1, xStart - 1);
      p_rest := substr(p_rest, xStart + 1);
    else
      xValue := p_rest;
      p_rest := null;
    end if;
    return xValue;
  end;
Begin

  while v_Rest is not null loop
    v_Source := rest(v_Rest);
    if p_type = 'UNICODE' then
      v_unicode := rest(v_target);
      v_value   := replace(v_value, v_Source, v_unicode);
    elsif p_type = 'LATIN' then
      v_unicode := rest(v_target_latin);
      v_value   := replace(v_value, v_Source, v_unicode);
    else
      v_unicode := rest(v_target);
      v_value   := replace(v_Source, v_value, v_unicode);
    end if;
  end loop;

  return v_value;
End;
