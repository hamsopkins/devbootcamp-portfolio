def straight_line_include?(word, puzzle)
	contains_word = false
	search_string = ""
	search_string << add_rows(puzzle) + " "
	search_string << add_columns(puzzle) + " "
	search_string << add_left_column_diags(puzzle) + " "
	search_string << add_left_row_diags(puzzle) + " "
	search_string << add_right_column_diags(puzzle) + " "
	search_string << add_right_row_diags(puzzle) + " "
	search_string += " #{search_string.reverse}"
	search_string.include?(word)
end

def snaking_include?(word, puzzle)
end
 
def add_rows(puzzle)
	result_string = ""
	puzzle.each { |row| result_string << row.join + " " }
	result_string
end

def add_columns(puzzle)
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


def add_left_column_diags(puzzle)
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


def add_left_row_diags(puzzle)
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



def add_right_column_diags(puzzle)
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

def add_right_row_diags(puzzle)
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
