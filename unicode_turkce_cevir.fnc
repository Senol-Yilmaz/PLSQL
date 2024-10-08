create or replace function unicode_turkce_cevir(p_metin in varchar2,
                                                p_tip   in varchar2 := 'UNICODE')
  return varchar2 deterministic is
  /* 
      Purpose:
      For Türkish language, converting Türkish Characters to Unicode characters
      For example Þenol Yýlmaz => &#350;enol Y&#305;lmaz
  
      How to use:
      p_Metin         => Text
      p_Tip           => Type, default "UNICODE"
    
      Change Log
      Date        By Whom               Description
      ----------  --------------------- --------------------------------------------------------------
      23.06.2017  Senol YILMAZ          Created
    
  */
  v_deger   varchar2(32767) := p_metin;
  v_kalan   varchar2(50) := 'ð~Ð~ý~Ý~ö~Ö~ü~Ü~þ~Þ~ç~Ç~';
  v_hedef   varchar2(400) := '&#287;~&#286;~&#305;~&#304;~&#246;~&#214;~&#252;~&#220;~&#351;~&#350;~&#231;~&#199;~';
  v_kaynak  varchar2(5);
  v_unicode varchar2(6);
  --Get Rest text
  function kalan(p_Kalan in out varchar2, p_sep in varchar2 := '~')
    return varchar2 deterministic is
    xDeger varchar2(4000);
    xBas   integer;
  
  begin
    xbas := instr(p_Kalan, p_sep, 1, 1);
    if xbas != 0 then
      xDeger  := substr(p_Kalan, 1, xbas - 1);
      p_Kalan := substr(p_Kalan, xbas + 1);
    else
      xDeger  := p_kalan;
      p_kalan := null;
    end if;
    return xDeger;
  end;
Begin

  while v_kalan is not null loop
    v_kaynak  := kalan(v_kalan);
    v_unicode := kalan(v_hedef);
    if p_tip = 'UNICODE' then
      v_deger := replace(v_deger, v_kaynak, v_unicode);
    else
      v_deger := replace(v_kaynak, v_deger, v_unicode);
    end if;
  end loop;

  return v_deger;
End;
/
