# PSEUDOCODE

# input = an array, an item to search for
# output = nil if the itme isnt in the array, the index at which the item was found

# Pick a point in the middle
# Compare what we find in the middle to what we're searching for
# If we found what we're looking for, we're done!
# If we didn't find what we're looking for, pick the left or right half to keep searching
# Apply the same process to our new half

def binary_search(array, item, upper_limit = array.length - 1, lower_limit = 0)
  breakpoint = (upper_limit + lower_limit)/2
  return breakpoint if array[breakpoint] == item
  if array[breakpoint] > item
    upper_limit = breakpoint - 1
  else
    lower_limit = breakpoint + 1
  end
  return nil if upper_limit - lower_limit == 1
  binary_search(array, item, upper_limit, lower_limit)
end

# DRIVER CODE
# binary_search(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"], "b")
