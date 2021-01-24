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
  attr_accessor :head

  def initialize()
    @head = nil
  end

  # Get the value of the index-th node in the linked list. If the index is invalid, return -1.
  def get(index)
    i = 0
    head = @head

    while !head.nil? && i<index
      return -1 if head.nil?
      head = head.next
      i+=1
    end

    case head
      when nil then return -1
      else return head.val
      end
  end

  # Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
  def add_at_head(val)
    new_head = ListNode.new(val)
    new_head.next = @head
    @head = new_head
  end

  # Append a node of value val to the last element of the linked list.
  def add_at_tail(val)
    new_tail = ListNode.new(val)
    head = @head
    case @head
      when nil then @head = new_tail
      else
        while !head.next.nil?
          head = head.next
        end
        head.next = new_tail
      end
  end

  # Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted.
  def add_at_index(index, val)
    node = ListNode.new(val)

    case index
      when 0
      then
        node.next = @head
        @head = node
      else
        i = 0
        head = @head
        while i<index-1
            return if head.nil?
            head = head.next
            i+=1
        end
        return if head.nil?
        node.next = head.next
        head.next = node
      end
  end

  # Delete the index-th node in the linked list, if the index is valid.
  def delete_at_index(index)
    return if @head.nil?
    case index
    when 0 then @head = @head.next
    else
      i = 0
      head = @head
      while i < index-1
        return if head.nil?
        head = head.next
        i+=1
      end
      return if head.next.nil?
      head.next = head.next.next
    end
  end
end

class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
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
