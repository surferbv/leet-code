# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

=begin
problem:
    input:  array of posative integers
    output: an integer 1 or 0
    note:   if a is a permutation then the output is 1 otherwise, it is 0

    what is a permutation?
    e.g.    input:  a[4,1,3,2] 
            output: 1
            why:    because it contains each element from 1 to N only once
            

    What is N?
        N is the number of integers 
        e.g.
            input:  a[4,1,3,2]  N = 4           
        e.g. 
            input: a[4,1,3]     N = 3
=end

=begin
    Time:   O(n)
            Why? Three loops each running independently of each other
            in the worst case each loop has to go throught all the elements in the array
            thus O(n) + O(n) + O(n) = O(3n) = O(n)
    Space:  O(1)
            No additional memory is allocated.
=end


def solution(a)
    n_int = a.length
    result = 1

    # will change any values > n_int will be set to 1 
    # TODO: Could we stop here since we found a value that is greater than n_int? 
    i = 0
    while i < n_int 
        if a[i] > n_int
            a[i] = 1 
            return 0
        end
        i += 1
    end

    # mark our negative values based on the new index which is based on the element value
    i = 0
    while i < n_int 
        new_index = a[i].abs() - 1
        a[new_index] *= -1 if a[new_index] > 0 
        i += 1
    end

    # Check to see if any values in the array are not marked i.e. posative 
    # If they are not marked then, it is not a permutation.
    i = 0
    while i < n_int
        if a[i] > 0
            result = 0
            break
        end

        i += 1
    end

    result

end