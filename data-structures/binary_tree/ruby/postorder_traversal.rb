# Given the root of a binary tree, return the postorder traversal of its nodes' values.

# Input: root = [1,null,2,3]
# Output: [3,2,1]

# Input: root = []
# Output: []

# Input: root = [1]
# Output: [1]

# Input: root = [1,2]
# Output: [2,1]

# Input: root = [1,null,2]
# Output: [2,1]

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# Approach 1: Interative

# Complexity Analysis

# Time complexity: O(N), where N is the number of nodes.
# We visit each node exactly once, thus the time complexity is O(N).

# Space complexity: O(N). Up to O(H) to keep the stack,
# where H is a tree height. In the worst case of the skewed tree H = N.

# @param {TreeNode} root
# @return {Integer[]}
def postorder_traversal(root)
  return [] unless root

  array = []
  stack = [root]

  while not stack.empty? do
    node = stack.pop
    array.unshift(node.val)

    stack.push(node.left) if node.left
    stack.push(node.right) if node.right
  end

  array
end

# Approach 2: Recursive

# Complexity Analysis

# Time complexity: O(N), where N is the number of nodes.
# We visit each node exactly once, thus the time complexity is O(N).

# Space complexity: O(N). Up to O(H) to keep the stack,
# where H is a tree height. In the worst case of the skewed tree H = N.

# @param {TreeNode} root
# @return {Integer[]}
def postorder_traversal(root)
    return [] if root.nil?
    values = []
    traversal(root,values)
    return values
end

def traversal(root,values)
    traversal(root.left,values) if root.left
    traversal(root.right,values) if root.right
    values << root.val
end
