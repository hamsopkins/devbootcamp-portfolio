def convert_to_roman(arabic_number, options = {})
  roman_numeral = ""
  3.times do
    if arabic_number >= 1000
      roman_numeral += "M"
      arabic_number -= 1000
    end
  end

  if arabic_number >= 500
    roman_numeral += "D"
    arabic_number -= 500
  end

  4.times do
    if arabic_number >= 100
      roman_numeral += "C"
      arabic_number -= 100
    end
  end

  if arabic_number >= 50
    roman_numeral += "L"
    arabic_number -= 50
  end

  4.times do
    if arabic_number >= 10
      roman_numeral += "X"
      arabic_number -= 10
    end
  end

  if arabic_number >= 5
    roman_numeral += "V"
    arabic_number -= 5
  end

  4.times do
    if arabic_number >= 1
      roman_numeral += "I"
      arabic_number -= 1
    end
  end

if options[:modern]
  roman_numeral.gsub!("DCCCC", "CM")
  roman_numeral.gsub!("CCCC", "CD")
  roman_numeral.gsub!("LXXXX", "XC")
  roman_numeral.gsub!("XXXX", "XL")
  roman_numeral.gsub!("VIIII", "IX")
  roman_numeral.gsub!("IIII", "IV")

end

roman_numeral


end

p convert_to_roman(2999, {modern: true})