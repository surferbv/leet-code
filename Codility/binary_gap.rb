# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(n)
    # input:
    # An posative interger 
    #
    # output:
    # An integer that returns the length of the longest binary gap 
    #
    # input: 9
    # output: 2
    # reason: bin rep of 9 is 1001 is 2 because it is the larget consecutive number of zeros between two ones
    #
    # input: 20
    # output: 1
    # reason: bin representaion of 20 is 10100 and the space between two ones is 1 zeros 
    #
    # input: 32
    # output: 0
    # reason: does not contain a binary gap since 32 is 100000
  
    # Steps:
    # 1.  convert n to it's binary number
    # 1.1 create variable call it max_gap and current_gap
    # 2.  instantiate two pointers
    #   - one pointer for last one (prev) seen and second poiner (cur) which move ahead
    # 3.  iterating through array if we find another 1 we compare current_gap with max_gap
    #     if current_gap is > max_gap set max_gap to current_gap
    #     if current_gap runs to the end without seeing another one return max_gap
    #        
    #     Revision: to find the gap you can just substrac the difference betwene cur and prev
    #     and get the current_gap
  
    # 0123456789
    # 1000010001
  
    #1
    binary = []
    integer = n
  
    #1.1, 2
    max_gap = current_gap = 0
    cur = prev = 0
  
    while integer > 0
      binary.push(integer % 2)
      integer /= 2
    end
  
    binary = binary.reverse.join

    while cur < binary.length
      if binary[cur] == "1" 
        current_gap = cur - prev - 1 
        prev = cur 
      end
  
      if current_gap > max_gap
        max_gap = current_gap 
      end
  
      cur += 1
    end
    return max_gap
  end
  
  
  n = 1041
  puts solution(n)

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  