# Binary Search Algorithm

I wrote the following tail-recursive binary search algorithm along with one other junior dev on our third day of Phase 1 at Dev Bootcamp.

The algorithm operates as follows:

* The algorithm expects that the array to be searched is already sorted.
* When the algorithm is run, it accepts two arguments, `array` (the presorted array to be searched) and `item` (the item we're looking for). `upper_limit` is by default the index of the last item in `array`, and `lower_limit` is zero by default.
* The algorithm defines `breakpoint` as the index of the middle item of the array (more specifically, the middle item between the upper and lower limits -- more about that later!). If `array[breakpoint]` is `item`, the algorithm will stop there and return `breakpoint`.
* If `breakpoint` is greater than `item`, `upper_limit` will be defined as one less than `breakpoint`. Otherwise, `lower_limit` will be defined as one greater than `breakpoint`.
* Since the algorithm always checks if `breakpoint` is equal to `item`, if `upper_limit` and `lower_limit` are adjacent to one another in the array, it is not logically possible that the presorted array contains `item`, and the algorithm will return `nil`.
* The method will then call itself, passing in the new value of either `upper_limit` or `lower_limit`, and will continue breaking the array into smaller and smaller chunks to search until `item` is either found or it determines the array cannot logically contain `item` and returns `nil`.