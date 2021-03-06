# 5. Longest Palindromic Substring.rb

=begin
    Problem:
        Given a string s, return the longest palindromic substring in s.
    Time:
    Space:
    Notes:
=end

# @param {String} s
# @return {String}
def longest_palindrome(s)
    s_length        = s.length
    window_length   = 0
    left_edge       = 0
    right_edge      = 0

    return s if is_palindrome(s)
    
    i = 0
    while i < s_length - 1 
        window_length = s_length - (i + 1)
        
        # Somewhere on the left side
        left_edge   = 0
        right_edge  = window_length - 1
        substring   = s[left_edge..right_edge]
        return substring if is_palindrome(substring)
        
        left_edge   = 1
        right_edge  = window_length
        substring   = s[left_edge..right_edge]
        return substring if is_palindrome(substring)
        
        # Somewhere on the right side
        right_edge  = s_length - 1
        left_edge   = i + 1
        substring   = s[left_edge..right_edge]
        return substring if is_palindrome(substring)
        
        right_edge  = s_length - 2
        left_edge   = left_edge - 1
        substring   = s[left_edge..right_edge]
        return substring if is_palindrome(substring)
        
        # Somewhere in the middle
        left_edge   = i
        right_edge  = i
        substring   = s[left_edge..right_edge]
        return substring if is_palindrome(substring)
        


        i += 1
    end
end

def is_palindrome(s)
    return s == s.reverse
end

# Testing
s = "abcdef"
puts longest_palindrome(s)

s = "babad"
puts "#{longest_palindrome(s)} == bab"


s = "cbbd"
puts "#{longest_palindrome(s)} == bb"

s = "bb"
puts "#{longest_palindrome(s)} == bb"

s = "eabcb"
puts "#{longest_palindrome(s)} == bcb"

s = "abcdbbfcba"
puts "#{longest_palindrome(s)} == bb"



=begin
Process:
    Problem:
        Given a string s, return the longest palindromic substring in s.
        
        inputs:
            a string s 
            has a lenght of length 1 to 1000
            s can have digits 0-9 and english characters a-z

        outputs:
            longest substring that is a palindrome

            examples:
            1.  inputs: s = "babad"
                output: "bad" or "aba"
            
            2.  inputs: s = "cbbd"
                output: "bb"

            3.  inputs: "abababababa"
                output: "babababab"
        notes:
            notice that the longest substring must either include the first or the last character

    Algorithm:
        0. declare variable window_length
        .1 declare index window left_edge
        .2 decalre index window right_edge 
        1. if the string is of length 1 return the string
        2. if the string if of length 2 return either the first or the last index
        3. if the string is length > 2 
            - iterate
                - get the longest substring
                - check to see if it's a palindrome
                - if its a palindrome return result
                - else get the next longest substring
                    -   note: your new window will be be adjusted
                        i.e. if the window spanned from [0..n-1] next will be [1..n] thus
                        [0..n-1]
                        [1..n]
                        [2..n-2]
        
    Solve:
    Refine:
=end
