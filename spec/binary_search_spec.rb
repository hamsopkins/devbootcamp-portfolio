require_relative '../binary_search'

describe 'binary_search' do
  let(:array) { ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"] }

  it 'returns the index of an item in an array' do
    expect(binary_search(array, 'b')).to eq 1
  end

  it 'returns nil if the item isn\'t in the array' do
    expect(binary_search(array, 'unicorn')).to eq nil
  end

end
