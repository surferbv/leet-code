# 346. Moving Average from Data Stream
# Easy

# 1184

# 113

# Add to List

# Share
# Given a stream of integers and a window size, calculate the moving average of all integers in the sliding window.

# Implement the MovingAverage class:

# MovingAverage(int size) Initializes the object with the size of the window size.
# double next(int val) Returns the moving average of the last size values of the stream.
 

# Example 1:

# Input
# ["MovingAverage", "next", "next", "next", "next"]
# [[3], [1], [10], [3], [5]]
# Output
# [null, 1.0, 5.5, 4.66667, 6.0]

# Explanation
# MovingAverage movingAverage = new MovingAverage(3);
# movingAverage.next(1); // return 1.0 = 1 / 1
# movingAverage.next(10); // return 5.5 = (1 + 10) / 2
# movingAverage.next(3); // return 4.66667 = (1 + 10 + 3) / 3
# movingAverage.next(5); // return 6.0 = (10 + 3 + 5) / 3
 

# Constraints:

# 1 <= size <= 1000
# -105 <= val <= 105
# At most 104 calls will be made to next.

# Time:
# Space:
# Notes:
class MovingAverage

    attr_accessor :queue, :size

    # =begin
    #     :type size: Integer
    # =end
        def initialize(size)
            @next_call_count = 0
            @size = size
            @queue = []
        end
    
    
    # =begin
    #     :type val: Integer
    #     :rtype: Float
    # =end
        def next(val)
            result = 0
            temp = []
            
            # First add the item to the queue
            if @next_call_count < @size
                @queue.unshift(val)
            else
                @queue.pop()
                @queue.unshift(val)
            end

            @next_call_count += 1 if @next_call_count < @size

            return @queue.sum(0.0) / @next_call_count
            
        end
    
    end
    
    # Test code
    # Your MovingAverage object will be instantiated and called as such:
    # size = 3
    # obj = MovingAverage.new(size)
    # obj.next(1)
    # obj.next(10)
    # obj.next(3)
    # puts obj.next(5)