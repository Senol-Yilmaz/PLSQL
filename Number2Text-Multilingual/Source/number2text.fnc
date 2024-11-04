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
