# Design your implementation of the circular queue. The circular queue is a linear data structure in which the operations are performed based on FIFO (First In First Out) principle and the last position is connected back to the first position to make a circle. It is also called "Ring Buffer".
#
# One of the benefits of the circular queue is that we can make use of the spaces in front of the queue. In a normal queue, once the queue becomes full, we cannot insert the next element even if there is a space in front of the queue. But using the circular queue, we can use the space to store new values.
#
# Implementation the MyCircularQueue class:
#
# MyCircularQueue(k) Initializes the object with the size of the queue to be k.
# int Front() Gets the front item from the queue. If the queue is empty, return -1.
# int Rear() Gets the last item from the queue. If the queue is empty, return -1.
# boolean enQueue(int value) Inserts an element into the circular queue. Return true if the operation is successful.
# boolean deQueue() Deletes an element from the circular queue. Return true if the operation is successful.
# boolean isEmpty() Checks whether the circular queue is empty or not.
# boolean isFull() Checks whether the circular queue is full or not.
#
#
# Example 1:
#
# Input
# ["MyCircularQueue", "enQueue", "enQueue", "enQueue", "enQueue", "Rear", "isFull", "deQueue", "enQueue", "Rear"]
# [[3], [1], [2], [3], [4], [], [], [], [4], []]
# Output
# [null, true, true, true, false, 3, true, true, true, 4]
#
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

# Intuition
#
# Based on the description of the problem, an intuitive data structure that meets all the requirements would be a ring where the head and the tail are adjacent to each other.
#
# However, there does not exist a ring data structure in any programming language. A similar data structure at our disposal is the one called Array which is a collection of elements that reside continuously in one dimensional space.
#
# The essence of many design problems, is how one can build more advanced data structures with the basic building blocks such as Array.
#
# In this case, to build a circular queue, we could form a virtual ring structure with the Array, via the manipulation of index.
#
# Given a fixed size array, any of the elements could be considered as a head in a queue. As long as we know the length of the queue, we then can instantly locate its tail, based on the following formula:
#
# tailIndex = (headIndex + count − 1) mod capacity
#
# where the variable capacity is the size of the array, the count is the length of the queue and the headIndex and tailIndex are the indice of head and tail elements respectively in the array. Here we showcase a few examples how a circular queue could reside in a fixed size array.

# Algorithm
#
# The procedure to design a data structure lies essentially on how we design the attributes within the data structure.
#
# One of the traits of a good design is to have as less attributes as possible, which arguably could bring several benefits.
#
# Less attributes usually implies little or no redundancy among the attributes.
# The less redundant the attributes are, the simpler the manipulation logic, which eventually could be less error-prone.
# Less attributes also requires less space and therefore it could also bring efficiency to the runtime performance.
# However, it is not advisable to seek for the minimum set of attributes. Sometimes, a bit of redundancy could help with the time complexity. After all, like many other problems, we are trying to strike a balance between the space and the time.
#
# Following the above principles, here we give a list of attributes and the thoughts behind each attribute.
#
# queue: a fixed size array to hold the elements for the circular queue.
# headIndex: an integer which indicates the current head element in the circular queue.
# count: the current length of the circular queue, i.e. the number of elements in the circular queue. Together with the headIndex, we could locate the current tail element in the circular queue, based on the formula we gave previously. Therefore, we choose not to add another attribute for the index of tail.
# capacity: the capacity of the circular queue, i.e. the maximum number of elements that can be hold in the queue. One might argument that it is not absolutely necessary to add this attribute, since we could obtain the capacity from the queue attribute. It is true. Yet, since we would frequently use this capacity in our algorithm, we choose to keep it as an attribute, instead of invoking function len(queue) in Python at every occasion. Though in other programming languages such as Java, it might be more efficient to omit this attribute, since it is part of the attributes (queue.length) in Java array. Note: for the sake of consistency, we keep this attribute for all implementations.

# Complexity Analysis
#
# Time complexity: O(1). All of the methods in our circular data structure is of
# constant time complexity.
# Space Complexity: O(N). The overall space complexity of the data structure is
# linear, where N is the pre-assigned capacity of the queue. However, it is
# worth mentioning that the memory consumption of the data structure remains as
# its pre-assigned capacity during its entire life cycle.

class MyCircularQueue
  def initialize(k)
    @queue = [-1]*k
    @size = k
    @num = 0
    @head = 0
  end

  def en_queue(value)
    if @num < @size
      @queue[(@head + @num) % @size] = value
      @num += 1

      true
    else
      false
    end
  end

  def de_queue
    if @num == 0
      false
    else
      @queue[@head] = -1
      @head = (@head + 1) % @size
      @num -= 1

      true
    end
  end

  def front
    @num == 0 ? -1 : @queue[@head]
  end

  def rear
    @num == 0 ? -1 : @queue[(@head + @num - 1) % @size]
  end

  def is_empty
    @num == 0
  end

  def is_full
    @num == @size
  end
end

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
