require_relative '../word_search'

RSpec::Matchers.define :be_boolean do
  match do |actual|
    expect(actual).to satisfy { |x| x == true || x == false }
  end
end

describe 'straight_line_include?' do
	let(:puzzle) { [
		["a", "k", "f", "o", "x", "e", "s"], 
		["s", "o", "a", "w", "a", "h", "p"], 
		["i", "t", "c", "k", "e", "t", "n"],
		["o", "t", "s", "d", "h", "o", "h"],
		["s", "e", "x", "g", "s", "t", "a"],
		["u", "r", "p", "i", "w", "e", "u"],
		["z", "s", "b", "n", "u", "i", "r"]
		] }

	it 'returns a boolean' do
		expect(straight_line_include?("anything", puzzle)).to be_boolean
	end

	it 'returns true if word found in horizontal straight line in puzzle' do
		expect(straight_line_include?("foxes", puzzle)).to be true
	end

	it 'returns true if word found in vertical straight line in puzzle' do
		expect(straight_line_include?("otters", puzzle)).to be true
	end

	it 'returns true if word found in diagonal straight line in puzzle' do
		expect(straight_line_include?("bison", puzzle)).to be true
	end

	it 'returns false if word isn\'t found in straight line in puzzle' do
		expect(straight_line_include?("panda", puzzle)).to be false
	end

	it 'returns true if word is a left column diagonal in puzzle' do
		expect(straight_line_include?("eakse", puzzle)).to be true
	end
end

describe 'snaking_include?' do
end
