# Design your implementation of the linked list. You can choose to use a singly or doubly linked list.
# A node in a singly linked list should have two attributes: val and next. val is the value of the current node, and next is a pointer/reference to the next node.
# If you want to use the doubly linked list, you will need one more attribute prev to indicate the previous node in the linked list. Assume all nodes in the linked list are 0-indexed.
#
# Implement the MyLinkedList class:
#
# MyLinkedList() Initializes the MyLinkedList object.
# int get(int index) Get the value of the indexth node in the linked list. If the index is invalid, return -1.
# void addAtHead(int val) Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
# void addAtTail(int val) Append a node of value val as the last element of the linked list.
# void addAtIndex(int index, int val) Add a node of value val before the indexth node in the linked list. If index equals the length of the linked list, the node will be appended to the end of the linked list. If index is greater than the length, the node will not be inserted.
# void deleteAtIndex(int index) Delete the indexth node in the linked list, if the index is valid.
#

class MyLinkedList
  attr_accessor :head, :size

  def initialize()
    @head = nil
    @size = 0
  end

  # Get the value of the index-th node in the linked list. If the index is invalid, return -1.
  def get(index)
    return -1 if index > @size - 1 || index < 0

    current = index_position(index)
    current.value
  end

  # Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
  def add_at_head(val)
    new_node = Node.new(val)
    new_node.next = @head if @head
    @head = new_node
    @size += 1
  end


  # Append a node of value val to the last element of the linked list.
  def add_at_tail(val)
    current = @head
    add_at_head(val) unless current
    new_node = Node.new(val)

    while current.next
      current = current.next
    end

    current.next = new_node
    @size += 1
  end

  # Add a node of value val before the index-th node in the linked list.
  # If index equals to the length of linked list, the node will be appended
  # to the end of linked list. If index is greater than the length, the node
  # will not be inserted.
  def add_at_index(index, val)
    return if index > @size

    if index.zero? || index < 0
      add_at_head(val)
      return
    elsif index == @size
      add_at_tail(val)
      return
    end

    current = previous_index_position(index)
    tmp = current.next
    new_node = Node.new(val)
    new_node.next = tmp
    current.next = new_node
    @size += 1
  end

  # Delete the index-th node in the linked list, if the index is valid.
  def delete_at_index(index)
    return if index > @size - 1 || index < 0

    if index.zero? && @size == 1
      @head = nil
      @size = 0
      return
    end

    delete_at_head && return if index.zero?

    current = previous_index_position(index)
    current.next = nil && return unless current.next
    current.next = current.next.next
    @size -= 1
  end

  def index_position(index)
    i = 0
    current = @head
    while i < index
      current = current.next
      i += 1
    end
    current
  end

  def previous_index_position(index)
    i = 0
    current = @head
    while i < index - 1
      current = current.next
      i += 1
    end
    current
  end

  def delete_at_head
    next_node = @head.next
    @head = next_node
    @size -= 1
  end
end

class Node
  attr_accessor :value, :next

  def initialize(val)
    @value = val
    @next = nil
  end
end

# Your MyLinkedList object will be instantiated and called as such:
# obj = MyLinkedList.new()
# param_1 = obj.get(index)
# obj.add_at_head(val)
# obj.add_at_tail(val)
# obj.add_at_index(index, val)
# obj.delete_at_index(index)
