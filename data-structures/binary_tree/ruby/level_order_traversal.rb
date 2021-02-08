# Given a binary tree, return the level order traversal of its nodes' values.
# (i.e: from left to right, level by level).

# For example:
# Given binary tree [3,9,20,null,null,15,7],
# return its level order traversal as:
# [
#   [3],
#   [9,20],
#   [15,7]
# ]

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

#
# Approach 1: Recursive
#

# Algorithm
#
# The simplest way to solve the problem is to use a recursion.
# Let's first ensure that the tree is not empty, and then call recursively the function
# helper(node, level), which takes the current node and its level as the arguments.
# This function does the following:
# The output list here is called levels, and hence the current level is just a length of
# this list len(levels). Compare the number of a current level len(levels) with a node
# level. If you're still on the previous level - add the new one by adding a new list into levels.
# Append the node value to the last list in levels.
# Process recursively child nodes if they are not None : helper(node.left / node.right, level + 1).
#

# Complexity Analysis

# Time complexity: O(N) since each node is processed exactly once.
# Space complexity: O(N) to keep the output structure which contains N node values.

def level_order(root)
  result = []
  return result if root.nil?

  inner_level_order(root, 0, result)
  result
end

def inner_level_order(root, level, result)
  result[level] ||= []
  result[level] << root.val
  inner_level_order(root.left, level + 1, result) unless root.left.nil?
  inner_level_order(root.right, level + 1, result) unless root.right.nil?
end

#
# Approach 2: Iterative
#

# Algorithm
#
# The recursion above could be rewritten in the iteration form.
# Let's keep nodes of each tree level in the queue structure, which typically orders
# elements in a FIFO (first-in-first-out) manner. In Java one could use LinkedList
# implementation of the Queue interface. In Python using Queue structure would be an overkill
# since it's designed for a safe exchange between multiple threads and hence requires
# locking which leads to a performance loose. In Python the queue implementation with a
# fast atomic append() and popleft() is deque.
# The zero level contains only one node root. The algorithm is simple:
# Initiate queue with a root and start from the level number 0 : level = 0.
# While queue is not empty:
# Start the current level by adding an empty list into output structure levels.
# Compute how many elements should be on the current level : it's a queue length.
# Pop out all these elements from the queue and add them into the current level.
# Push their child nodes into the queue for the next level.
# Go to the next level level++.
#

# Complexity Analysis

# Time complexity: O(N) since each node is processed exactly once.
# Space complexity: O(N) to keep the output structure which contains N node values.

# @param {TreeNode} root
# @return {Integer[][]}
def level_order(root)
  return [] unless root

  arr = [root]
  order = [[root.val]]
  while arr.size > 0
    width = arr.size
    temp = []
    (0...width).each do |_i|
      node = arr.shift
      arr.push(node.left) unless node&.left.nil?
      arr.push(node.right) unless node&.right.nil?
      temp << node.left.val unless node&.left.nil?
      temp << node.right.val unless node&.right.nil?
    end
    order << temp unless temp.empty?
  end
  order
end
