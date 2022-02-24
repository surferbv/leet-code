# Design your implementation of the circular queue. The circular queue is a linear data structure in which the operations are performed based on FIFO (First In First Out) principle and the last position is connected back to the first position to make a circle. It is also called "Ring Buffer".

# One of the benefits of the circular queue is that we can make use of the spaces in front of the queue. In a normal queue, once the queue becomes full, we cannot insert the next element even if there is a space in front of the queue. But using the circular queue, we can use the space to store new values.

# Implementation the MyCircularQueue class:

# MyCircularQueue(k) Initializes the object with the size of the queue to be k.
# int Front() Gets the front item from the queue. If the queue is empty, return -1.
# int Rear() Gets the last item from the queue. If the queue is empty, return -1.
# boolean enQueue(int value) Inserts an element into the circular queue. Return true if the operation is successful.
# boolean deQueue() Deletes an element from the circular queue. Return true if the operation is successful.
# boolean isEmpty() Checks whether the circular queue is empty or not.
# boolean isFull() Checks whether the circular queue is full or not.
# You must solve the problem without using the built-in queue data structure in your programming language. 

# Example 1:

# Input
# ["MyCircularQueue", "enQueue", "enQueue", "enQueue", "enQueue", "Rear", "isFull", "deQueue", "enQueue", "Rear"]
# [[3], [1], [2], [3], [4], [], [], [], [4], []]
# Output
# [null, true, true, true, false, 3, true, true, true, 4]

# Explanation
# myCircularQueue = MyCircularQueue.new(3);
# myCircularQueue.en_queue(1); // return True
# myCircularQueue.en_queue(2); // return True
# myCircularQueue.en_queue(3); // return True
# myCircularQueue.en_queue(4); // return False
# myCircularQueue.rear();     // return 3
# myCircularQueue.is_full();   // return True
# myCircularQueue.de_queue();  // return True
# myCircularQueue.en_queue(4); // return True
# myCircularQueue.rear();     // return 4

# Constraints:

# 1 <= k <= 1000
# 0 <= value <= 1000
# At most 3000 calls will be made to en_queue, de_queue, Front, Rear, isEmpty, and is_full

# Time: 
# enqueue: O(1)
# dequeue: O(1)
# front: O(1)
# rear: O(1)
# isEmpty: O(1)
# isFull: O(1)
# Search: O(n)
# If it's the last item it needs to go through all the items in the array
#
# Space: O(n)
# Depends on the size allocaeed k
#
# Notes:
# load './622.DesignCircularQueue.rb'
#
class MyCircularQueue

    attr_accessor :tail, :queue, :head, :size 

    # =begin
    #     :type k: Integer
    # =end
        def initialize(k)
            @tail = @head = nil         # index
            @queue = Array.new(k,nil)    # array of size k filled with nil values
            @size = k
        end
    
    # =begin
    #     :type value: Integer
    #     :rtype: Boolean
    # =end
        def en_queue(value)

            return false if is_full()

            if is_empty()
                @tail = @head = 0
                @queue[@tail] = value
                return true
            end

            if !is_empty()
                @tail = (@tail + 1) % @size
                @queue[@tail] = value
                return true
            end
            
        end
    
    
    # =begin
    #     :rtype: Boolean
    # =end
        def de_queue()

            return false if is_empty()

            # We remove an item in a full q
            if is_full()
                @queue[@head] = nil
                @head = (@head + 1) % @size
                return true
            end
            
            # We remove an item just before empty => @head == @tail 
            if @tail == @head 
                @queue[@head] = nil
                @head = @tail = nil # We set them to empty
                return true
            else
                # We remove an item when the q is not full
                @queue[@head] = nil
                @head = (@head + 1) % @size
                return true
            end    
            
        end
    
    
    # =begin
    #     :rtype: Integer
    # =end
        def front()
            return -1 if is_empty()
            return @queue[@head]
        end
        
        
        # =begin
        #     :rtype: Integer
        # =end
        def rear()
            return -1 if is_empty()
            return @queue[@tail]
        end
    
    
    # =begin
    #     :rtype: Boolean
    # =end
        def is_empty()
            rtype = false

            # Only empty with both are nil
            rtype = true if !@tail && !@head 

            # Remember to reset the @head and @ tail when dequque is called
            rtype
        end
    
    
    # =begin
    #     :rtype: Boolean
    # =end
        def is_full()
            rtype = false

            # Check if empty
            return false if is_empty() 
            
            # Next tail 
            nxt_tail = (@tail + 1) % @size 

            # If next tail is same as head it's full
            rtype = true if nxt_tail == @head

            rtype
        end
    
    end