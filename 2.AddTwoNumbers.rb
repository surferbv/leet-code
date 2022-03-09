# 2.AddTwoNumbers.rb

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

#     problem:
#         input:  
#             two linked list representing two non-negative numbers
#         output: 
#             a linked list resulting in the sum of he two numbers
#         note:
#             digits are tored in reverse order 
#                 i.e. 435 => [5,3,4]
#             the numbers to not contain any leading zeros
#                 i.e. 035 => not going to happen
#             you can have input of un-equal size
#                 i.e. [1,2,4] + [2,3]
#             you can assume that you are always given two non-empty linked lists
#         example:
#             1.  input:
#                 [2,4,3]
#                 [5,6,4]

#                 output:
#                 [7,0,8]

#                 explaination:
#                 342 + 465 = 807
            
#             2.  input:
#                 [0]

#                 output:
#                 [0]

#                 explanation:
#                 0 + 0 = 0

#             3.  input:
#                 [9,9,9,9,9,9,9]
#                 [9,9,9,9]

#                 output:
#                 [8,9,9,9,0,0,0,1]
#     algorithm:
#     0.  create a new linked list to hold the result
#     1.  create a variable to hold the carry
#     1.1 create two pointers to traverse each l1ptr and l2ptr current starting at the head 
#     2.  iterate node by node starting from the head
#     adding the values of those nodes and storing them into the result linked list
#     if we have a carry from the step above we store it and add it on the next iteration
#         Q: What if the linked list that are not the same in size?
#         Q: What if we have a carry at the end
    
# Time: O(n)
#       In the worst case we would have to treverse the longest list call it n and the shorter m
#       so O(n) + O(m) n is greater thus O(n)
# Space:O(n)
#       We construct a new linked list which will be the longest of the lists sizes.    
# Notes:
#       Mess up on traversing the current pointer when setting it to the dummy head or initially what I called it was result
#       If you want to treverse set current = dummyHead then update current to the new node by current.next = new_node
#       then set current = current.next
#   
#       DummyHead neat trick just be sure to return it's next like dummy_head.next at the result.
def add_two_numbers(l1, l2)
    # 0,1,1.1
    result      = ListNode.new(0)
    current     = result
    carry       = 0
    l1ptr       = l1
    l2ptr       = l2

    # 2 notice that we only stop when both are nil
    while l1ptr || l2ptr
        
        # add the two values and carry if it's not nil store it in the result 
        # we will need to account for current pointers being nil we could simple use a ternary operator 
        # if the nil return 0 otherwise use the value.
        new_val = (l1ptr.nil? ? 0 : l1ptr.val) + (l2ptr.nil? ? 0 : l2ptr.val) + carry

        # we have our carry and ones part seperated from our digit
        carry   = new_val.digits[1].nil? ? 0 : new_val.digits[1]
        ones    = new_val.digits[0]
        
        # new node
        new_node = ListNode.new(ones,nil)
        
        # we then construct our result using the ones
        # TODO: later on we will need to include the carry to the result
        # Need to check if result is empty
        current.next = new_node 
        current = current.next
        
        # we then move each respective pointer to the next node
        l1ptr = l1ptr&.next
        l2ptr = l2ptr&.next
    end
    # if we have a left over carry     
    current.next = ListNode.new(carry) if carry > 0
    
    result.next
    
end
