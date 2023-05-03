# Design your implementation of the circular queue. 
# The circular queue is a linear data structure in which the operations are performed based on FIFO (First In First Out) principle and the last position is connected back to the first position to make a circle.
# It is also called "Ring Buffer".

# One of the benefits of the circular queue is that we can make use of the spaces in front of the queue. 
# In a normal queue, once the queue becomes full, we cannot insert the next element even if there is a space in front of the queue. 
# But using the circular queue, we can use the space to store new values.

# Implementation the MyCircularQueue class:
# MyCircularQueue(k) Initializes the object with the size of the queue to be k.
# int Front() Gets the front item from the queue. If the queue is empty, return -1.
# int Rear() Gets the last item from the queue. If the queue is empty, return -1.
# boolean enQueue(int value) Inserts an element into the circular queue. Return true if the operation is successful.
# boolean deQueue() Deletes an element from the circular queue. Return true if the operation is successful.
# boolean isEmpty() Checks whether the circular queue is empty or not.
# boolean isFull() Checks whether the circular queue is full or not.
  
# You must solve the problem without using the built-in queue data structure in your programming language. 

# Solution: Implement two pointers @front & @rear.
class MyCircularQueue

=begin
    :type k: Integer
=end
    def initialize(k)
        @size = k
        # initialize the queue as an fixed size array.
        @circular_queue = [nil] * k
        @front = @rear = -1
    end


=begin
    :type value: Integer
    :rtype: Boolean
=end
    def en_queue(value)
        return false if is_full
        
        # insert the first element, both pointer should be pointed to 0 of the queue array.
        if is_empty
            @front = @rear = 0
            @circular_queue[@rear] = value
            return true
        end
        
        # @rear is possible to be the last element of array,
        # so to add element in this situation we need to mod @size to form the circular.
        @rear = (@rear + 1) % @size
        @circular_queue[@rear] = value
        
        true
    end


=begin
    :rtype: Boolean
=end
    def de_queue()
        return false if is_empty
        
        @circular_queue[@front] = nil
        # If the queue only has one value, both pointer will poit to the same index.
        # So reset them to -1 as empty.
        # Else we will need to reset the @front pointer. 
        if @front == @rear
            @front = @rear = -1
        else
            @front = (@front + 1) % @size
        end
        
        true
    end


=begin
    :rtype: Integer
=end
    def front()
        return -1 if is_empty
        
        @circular_queue[@front]
    end


=begin
    :rtype: Integer
=end
    def rear()
        return -1 if is_empty
        
        @circular_queue[@rear]
    end


=begin
    :rtype: Boolean
=end
    def is_empty()
        @rear == -1 && @front == -1
    end


=begin
    :rtype: Boolean
=end
    def is_full()
        (@rear + 1) % @size == @front
    end


end

# Your MyCircularQueue object will be instantiated and called as such:
# obj = MyCircularQueue.new(k)
# param_1 = obj.en_queue(value)
# param_2 = obj.de_queue()
# param_3 = obj.front()
# param_4 = obj.rear()
# param_5 = obj.is_empty()
# param_6 = obj.is_full()
