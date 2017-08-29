def straight_line_include?(word, puzzle)
	search_string = ""
	search_string << all_rows_of(puzzle)
	search_string << all_columns_of(puzzle)
	search_string << all_left_column_diags_of(puzzle)
	search_string << all_left_row_diags_of(puzzle)
	search_string << all_right_column_diags_of(puzzle)
	search_string << all_right_row_diags_of(puzzle)
	search_string += search_string.reverse
	search_string.include?(word)
end

def all_rows_of(puzzle)
	result_string = ""
	puzzle.each { |row| result_string << row.join + " " }
	result_string
end

def all_columns_of(puzzle)
	result_string = ""
	column = 0
	while column < puzzle[0].length
		row = 0
		while row < puzzle.length
			result_string << puzzle[row][column]
			row += 1
		end
		result_string << " "
		column += 1
	end
	result_string
end


def all_left_column_diags_of(puzzle)
	result_string = ""
	(1...puzzle[0].length).each do | x |
		y = 0
		while x >= 0
			result_string << puzzle[y][x]
			x -= 1
			y += 1
		end
		result_string << " "
	end
	result_string
end


def all_left_row_diags_of(puzzle)
	result_string = ""
	(0...puzzle.length).each do | y |
		x = puzzle[0].length - 1
		while y < puzzle.length
			result_string << puzzle[y][x]
			x -= 1
			y += 1
		end
		result_string << " "
	end
	result_string
end



def all_right_column_diags_of(puzzle)
	result_string = ""
	(0...(puzzle[0].length - 1)).each do | x |
		y = 0
		while x < puzzle[0].length
			result_string << puzzle[y][x]
			x += 1
			y += 1
		end
		result_string << " "
	end
	result_string
end

def all_right_row_diags_of(puzzle)
	result_string = ""
	(0..(puzzle.length - 2)).each do | y |
		x = 0
		while y < puzzle.length
			result_string << puzzle[y][x]
			x += 1
			y += 1
		end
		result_string << " "
	end
	result_string
end
