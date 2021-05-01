# frozen_string_literal: true

# Design a HashSet without using any built-in hash table libraries.
#
# Implement MyHashSet class:
#
# void add(key) Inserts the value key into the HashSet.
# bool contains(key) Returns whether the value key exists in the HashSet or not.
# void remove(key) Removes the value key in the HashSet. If key does not exist in the HashSet, do nothing.
#
#
# Example 1:
#
# Input
# ["MyHashSet", "add", "add", "contains", "contains", "add", "contains", "remove", "contains"]
# [[], [1], [2], [1], [3], [2], [2], [2], [2]]
# Output
# [null, null, null, true, false, null, true, null, false]
#
# Explanation
# MyHashSet myHashSet = new MyHashSet();
# myHashSet.add(1);      // set = [1]
# myHashSet.add(2);      // set = [1, 2]
# myHashSet.contains(1); // return True
# myHashSet.contains(3); // return False, (not found)
# myHashSet.add(2);      // set = [1, 2]
# myHashSet.contains(2); // return True
# myHashSet.remove(2);   // set = [1]
# myHashSet.contains(2); // return False, (already removed)
#
#
# Constraints:
#
# 0 <= key <= 106
# At most 104 calls will be made to add, remove, and contains.
#
#
# Follow up: Could you solve the problem without using the built-in HashSet library?

class MyHashSet
  # Initialize your data structure here.
  def initialize
    @array = Array.new(0)
  end

  # :type key: Integer
  # :rtype: Void
  def add(key)
    @array[key] = true
  end

  # :type key: Integer
  # :rtype: Void
  def remove(key)
    @array[key] = nil
  end

  # Returns true if this set contains the specified element
  # :type key: Integer
  # :rtype: Boolean
  def contains(key)
    !!@array[key]
  end
end

obj = MyHashSet.new

obj.add(2)
obj.add(3)
puts obj.contains(2)
puts obj.contains(3)

obj.remove(3)
puts obj.contains(3)
