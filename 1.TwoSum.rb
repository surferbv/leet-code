# 1.TwoSum.rb

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

=begin
    [2,7,11,15] T: 9
    2 + x = 9
    x = 9 - 2 = 6 NO {7=>0}
    
    7 + x = 9
    x = 9 - 7 = 2 YES {7=>0, 2=>1}
    
    11 + x = 9
    x = 9 + -11 = -2 NO
    
    15 + x = 9
    x = 9 + -15 = -6 NO
=end

=begin
    Time: O(n)
    Space: O(n)
    Notes:
        - use the the complement of the target
        - use a hash 
=end

def two_sum(nums, target)
    map = {}
    
    nums.each_with_index do |n,i|
        complement = target - n
        
        if map.key?(n) 
            return [map[n], i]
        else
            map[complement] = i
        end
        
    end
    return [nil, nil]
end

