# frozen_string_literal: true

# Given the root of an n-ary tree, return the postorder traversal of its nodes' values.

# Nary-Tree input serialization is represented in their level order traversal.
# Each group of children is separated by the null value (See examples)

# Example 1:
# Input: root = [1,null,3,2,4,null,5,6]
# Output: [5,6,3,2,4,1]

# Example 2:
# Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
# Output: [2,6,14,11,7,3,12,8,4,13,9,10,5,1]

#
# Approach 1: Recursive
#

def postorder(root)
  @answer = []
  dfs(root)
  @answer
end

def dfs(x)
  return if x.nil?

  x.children.each do |y|
    dfs(y)
  end
  @answer.push(x.val)
end

#
# Approach 2: Iterative
#

# Complexity Analysis
#
# Time complexity: we visit each node exactly once, thus the time complexity is O(N),
# where N is the number of nodes, i.e. the size of tree.
# Space complexity: depending on the tree structure, we could keep up to the entire tree,
# therefore, the space complexity is O(N).

def postorder(x)
  ans = []

  # What will I save as a state?
  # - node
  # - pointer of a child for a next traversal
  stack = [[x, 0]]

  until stack.empty?
    # Get current state.
    state = stack.last
    node = state[0]
    pointer = state[1]
    if node.nil?
      stack.pop
    elsif node.children.size == pointer
      ans.push(node.val)
      stack.pop
    else
      stack.last[1] += 1
      stack.push([node.children[pointer], 0])
    end
  end
  ans
end
