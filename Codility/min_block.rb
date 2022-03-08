# Time: O(n)
# Run through array once to find the largest consecutive string and once more the find the differences for each 
# O(n) + O(n) = O(n + n) = O(2n) = O(n)
#
# Space: O(1) 
# No additional data structures where created.
#
# Notes:
#

def solution( s )

  count     = 0 # the largest consecutive block of common characters
  cur_count = 1 # we start at one becuse it will be the first thing we see
  min_count = 0 # minimum count of additional letters

  # This for loop find the largest consecutive common block. 
  # Note that i can be considered as current
  # Notice that i will eventually fall of the array but that's okay as
  # it will be caught when prev != s [ i ] or current. 
  for i in ( 1..s.length ) do 
    prev = s[ i - 1 ]

    cur_count += 1 if prev == s[ i ]

    if prev != s[ i ]
      # puts "Cur count b4 reset: #{cur_count}" # troubleshooting

      count = cur_count if cur_count > count

      cur_count = 1
    end

  end 

  # run through the array again to add up the number of minimum additional letters
  # that sum up to count
  cur_count = 1 # reset 
  for i in ( 1..s.length ) do 
    prev = s[ i - 1 ]

    cur_count += 1 if prev == s[ i ]

    if prev != s[ i ]
      min_count = min_count + (count - cur_count)

      count = cur_count if cur_count > count

      cur_count = 1
    end

  end 
  
  # puts "Longest block: #{ count }"
  puts "Mimimum additional letters: #{ min_count } "
  
end

r = "abbabbaaa"
s = "babaa"
s1 = "bbbab"
s2 = "bbbaaabbb"

puts "Testing: #{r}"
solution(r);
puts

puts "Testing: #{s}"
solution(s);
puts

puts "Testing: #{s1}"
solution(s1);
puts

puts "Testing: #{s2}"
solution(s2);