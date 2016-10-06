# straight_line_include?
# INPUT PARAMS: word to search for (string), puzzle (array of arrays of equal length)
# OUTPUT: boolean if word is contained in a straight line in the puzzle (horizontal, vertical, or diagonal; backwards or forwards)

# PROCEDURE



# Create empty string SEARCH STRING
# iterate through each index of puzzle - each index is an array - join EVERY index of puzzle into a string and feed it into SEARCH STRING

# count the ROWS, iterate through each row (use puzzle.length), creating a string of each row from top to bottom, feed each string into SEARCH STRING

# starting at index 1 of index 0 of puzzle, create strings










# SEARCH STRING += SEARCH STRING . REVERSE


def straight_line_include?(word, puzzle)
	contains_word = false
	search_string = ""
	search_string << add_rows(puzzle)
	search_string << add_columns(puzzle)
	search_string += search_string.reverse
	search_string.include?(word)
end

def snaking_include?(word, puzzle)
end

def add_rows(puzzle)
	result_string = ""
	puzzle.each { |row| result_string << row.join }
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
		column += 1
	end
	result_string
end


def add_left_diags(puzzle)
end

def add_right_diags(puzzle)
end


