# 214. Shortest Palindrome


# @param {String} s
# @return {String}

# Time: O(n^2)
# Have to iterate over the entire string length
# Then for each iteration we comapre the subsrings 
# This is n * n 
#
# Space: O(n) or O(1) ?
# We create a new reverse string to do an initial compare. 
# I didn't crate any extra strings just used the existsing one to create substrings.  
#
# Notes:
# Approach 1 brute force...
# Hmm but in leet code still got 100% time and space efficency? 
def shortest_palindrome(s)
    s_rev = s.reverse
    s_size = s.length

    i = 0
    while i < s_size 
        return s if s == s_rev
        return s_rev[0..i - 1] + s if s_rev[i..] == s[0..(s_size - 1) - i]
        i += 1
    end 
    return ''
    
end

# Hard

# 2239

# 181

# Add to List

# Share
# You are given a string s. You can convert s to a palindrome by adding characters in front of it.

# Return the shortest palindrome you can find by performing this transformation.

# Example 1:

# Input: s = "aacecaaa"
# Output: "aaacecaaa"
# Example 2:

# Input: s = "abcd"
# Output: "dcbabcd"
 

# Constraints:

# 0 <= s.length <= 5 * 104
# s consists of lowercase English letters only.

# Testing 
# s = "abcbabcab"
# puts  shortest_palindrome(s)
