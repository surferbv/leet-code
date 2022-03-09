# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"
# keep track of max possible returned value which will be the length of the array + 1
# If no 1 exists return 1 base case
# Replace all values <= 0 and values > a.length with 1 
# Using the values in the array as indicies. If the values at the index is posative set it to negative
# Now go through the array again and return the first posative value. This will be the smallest possible integer
# If not posatives values are left in the array return the max possible value. 

# Trick:
# Uses values as indicides to jump to the next value
# This only works if the array is restricted to [1..100,000]
# When using the values in the array as new indicies be sure to subtract by one.
# Only use those new_incidies that are > 0
# If you find a value that is pos then you return it's index + 1 because it's off by one initially. 
def solution(a)
  
    length = a.length
  
    smallest_possible = length + 1        # Should be called max_possible ?
  
    # default case
    return 1 if !a.include?(1)
  
    # clean invalid values
    i = 0 
    while i < length
      a[i] = 1 if a[i] <= 0 || a[i] > length
      i += 1
    end
  
  
    # mark them negative
    i = 0
    while i < length
      new_index = a[i].abs() - 1              # values off by one
      a[new_index] *= -1 if a[new_index] > 0  # but need to check it's not out of bounds
      i += 1
    end
  
    # return first posative value the index is the missing value 
    i = 0
    while i < length
      return i + 1 if a[i] > 0
        
      i += 1
    end
  
    return smallest_possible
  
  end
  