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
# MyCircularQueue myCircularQueue = new MyCircularQueue(3);
# myCircularQueue.enQueue(1); // return True
# myCircularQueue.enQueue(2); // return True
# myCircularQueue.enQueue(3); // return True
# myCircularQueue.enQueue(4); // return False
# myCircularQueue.Rear();     // return 3
# myCircularQueue.isFull();   // return True
# myCircularQueue.deQueue();  // return True
# myCircularQueue.enQueue(4); // return True
# myCircularQueue.Rear();     // return 4

# Constraints:

# 1 <= k <= 1000
# 0 <= value <= 1000
# At most 3000 calls will be made to enQueue, deQueue, Front, Rear, isEmpty, and isFull

class MyCircularQueue

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
            rtype = false

            if is_full()
              return false
            end

            if is_empty()
                @tail = @head = 0
                @queue[@tail] = value
                @tail +=1
                return true
            end

            if !is_empty()
                @tail += 1
                @queue[@tail] = value
                return true
            end
            
        end
    
    
    # =begin
    #     :rtype: Boolean
    # =end
        def de_queue()
            
        end
    
    
    # =begin
    #     :rtype: Integer
    # =end
        def front()
            
        end
    
    
    # =begin
    #     :rtype: Integer
    # =end
        def rear()
            
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
            nxt_tail = (@tail += 1) % @size 

            # If next tail is same as head it's full
            rtype = true if nxt_tail == @head

            rtype
        end
    
    end
    
    # Your MyCircularQueue object will be instantiated and called as such:
    obj = MyCircularQueue.new(4)
    
    param_1 = obj.is_empty()
    puts "Empty: #{param_1}"
    param_2 = obj.is_full()
    puts "Full: #{param_2}"
    
    param_3 = obj.en_queue(9)
    param_3 = obj.en_queue(9)
    param_3 = obj.en_queue(9)
    param_3 = obj.en_queue(9)
    param_3 = obj.en_queue(9)
    puts "Enqueue: #{param_3}"
    
    param_1 = obj.is_empty()
    puts "Empty: #{param_1}"
    param_2 = obj.is_full()
    puts "Full: #{param_2}"
    