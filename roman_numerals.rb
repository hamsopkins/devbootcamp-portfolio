def convert_to_roman(arabic_number)
  roman_numeral = ""


  4.times do
    if arabic_number >= 1
      roman_numeral += "I"
      arabic_number -= 1
    end
  end

roman_numeral
end

#p convert_to_roman(1)
