# Word Search

I wrote the following algorithm as a solo challenge at the end of my first week on campus at Dev Bootcamp. It determines if a word is present in a word search puzzle in the format of nested arrays. The method `straight_line_include?` accepts two arguments: first, the word to be searched, and second, the puzzle as nested arrays. 

The puzzle must be an array of equal-length arrays. Each index of the inner arrays should be a string consisting of a single character. The algorithm is capable of detecting words forward and backwards horizontally, vertically, and diagonally. It will return true if the word is detected and false otherwise.