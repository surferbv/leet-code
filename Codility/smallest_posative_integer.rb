# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

# This is a demo task.

# Write a function:

# def solution(a)

# that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

# For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

# Given A = [1, 2, 3], the function should return 4.

# Given A = [−1, −3], the function should return 1.

# Write an efficient algorithm for the following assumptions:

# N is an integer within the range [1..100,000];
# each element of array A is an integer within the range [−1,000,000..1,000,000].
# Copyright 2009–2022 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.


def solution(a)
  length = a.length
    
    max_possible = length + 1
    
    # If there isn't 1 in the array   
    return 1 if !a.include?(1)
        
    # Remove 0's, values <= 0, and values > a.length
    a.each_with_index do |num,i|
         if num <= 0 || num > a.length           
             a[i] = 1
         end
    end
        
    # Using the value as index mark values negative if seen
    i = 0
    while i < a.length
        new_index = a[i].abs() - 1
        
        a[new_index] *= -1 if a[new_index] > 0
        
        i += 1
    end
    
    
    # If the value is positive then return it as it's the first missing positive
    i = 0
    while i < a.length
        return i + 1  if a[i] > 0
        
        i += 1
    end
    
    # If no values are positive then the missing number is the max_possible
    return max_possible

end
