# frozen_string_literal: true

# Given the root of an n-ary tree, return the preorder traversal of its nodes' values.
# Nary-Tree input serialization is represented in their level order traversal. Each group of children is separated by the null value (See examples)

# Example 1:
# Input: root = [1,null,3,2,4,null,5,6]
# Output: [1,3,5,6,2,4]

# Example 2:
# Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
# Output: [1,2,3,6,7,11,14,4,8,12,5,9,13,10]

# Definition for a Node.
class Node
  attr_reader :val, :children

  def initialize(val, children = nil)
    @val = val
    @children = children
  end
end

#
# Approach 1: Iterative
#

# Let's start from the root and then at each iteration pop the current node out
# of the stack and push its child nodes. In the implemented strategy we push nodes
# into output list following the order Top->Bottom and Left->Right, that naturally
# reproduces preorder traversal.

# Complexity Analysis
#
# Time complexity: we visit each node exactly once, and for each visit, the
# complexity of the operation (i.e. appending the child nodes) is proportional
# to the number of child nodes n (n-ary tree). Therefore the overall time
# complexity is O(N), where N is the number of nodes, i.e. the size of tree.
# Space complexity: depending on the tree structure, we could keep up to the
# entire tree, therefore, the space complexity is O(N).

def preorder(root)
  result = []
  return result if root.nil?

  stack = []
  stack << root

  until stack.empty?
    current_node = stack.pop
    result << current_node.val
    current_node.children.reverse.each do |child|
      stack << child
    end
  end

  result
end

#
# Approach 2: Recursive
#

def preorder(root)
  @result = []

  dfs(root)

  @result
end

def dfs(node)
  return unless node

  @result << node.val

  node.children.each do |child|
    dfs(child)
  end
end

# node5 = Node.new(5, [])
# node6 = Node.new(6, [])
# node2 = Node.new(2, [])
# node4 = Node.new(4, [])
# node3 = Node.new(3, [node5, node6])
# node1 = Node.new(1, [node3, node2, node4])
