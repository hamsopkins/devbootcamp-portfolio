require_relative '../roman_numerals'

describe 'converting an Arabic number to a Roman numeral' do
  describe 'old Roman numerals' do
    it 'converts 1 to I' do
      expect(convert_to_roman(1)).to eq "I"
    end

    it 'converts 4 to IIII' do
      expect(convert_to_roman(4)).to eq "IIII"
    end

    it 'converts 2769 to MMDCCLXVIIII' do
      expect(convert_to_roman(2769)).to eq "MMDCCLXVIIII"
    end

    it 'converts 10 to X' do
      expect(convert_to_roman(10)).to eq "X"
    end

    it 'converts 5 to V' do
      expect(convert_to_roman(5)).to eq "V"
    end

    it 'converts 111 to CXI' do
      expect(convert_to_roman(111)).to eq "CXI"
    end

  end

  describe 'modern Roman numerals' do
    it 'converts 1749 to MDCCXLIX' do
      expect(convert_to_roman(1749, {modern: true})).to eq "MDCCXLIX"
    end

    it 'converts 999 to CMXCIX' do
      expect(convert_to_roman(999, {modern: true})).to eq "CMXCIX"
    end

    it 'converts 123 to CXXIII' do
      expect(convert_to_roman(123, {modern: true})).to eq "CXXIII"
    end

    it 'converts 888 to DCCCLXXXVIII' do
      expect(convert_to_roman(888, {modern: true})).to eq "DCCCLXXXVIII"
    end

    it 'converts 2949 to MMCMXLIX' do
      expect(convert_to_roman(2949, {modern: true})).to eq "MMCMXLIX"
    end

it 'converts 2499 to MMCDXCIX' do
      expect(convert_to_roman(2499, {modern: true})).to eq "MMCDXCIX"
    end
  end
end
