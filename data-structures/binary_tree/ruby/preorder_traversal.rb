# Given the root of a binary tree, return the preorder traversal of its nodes' values.

# Input: root = [1,null,2,3]
# Output: [1,2,3]

# Input: root = []
# Output: []

# Input: root = [1]
# Output: [1]

# Input: root = [1,2]
# Output: [1,2]

# Input: root = [1,null,2]
# Output: [1,2]

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# There are two general strategies to traverse a tree:

# Breadth First Search (BFS)
#
# We scan through the tree level by level, following the order of height,
# from top to bottom. The nodes on higher level would be visited before the
# ones with lower levels.
#
# Depth First Search (DFS)
#
# In this strategy, we adopt the depth as the priority, so that one would start
# from a root and reach all the way down to certain leaf, and then back to root
# to reach another branch.
#
# The DFS strategy can further be distinguished as preorder, inorder, and postorder
# depending on the relative order among the root node, left node and right node.
#
# On the following figure the nodes are numerated in the order you visit them,
# please follow 1-2-3-4-5 to compare different strategies.

# Time complexity: we visit each node exactly once, thus the time complexity is `O(N)`,
# where N is the number of nodes, i.e. the size of tree.

# Space complexity: depending on the tree structure, we could keep up to the entire tree,
# therefore, the space complexity is `O(N)`.

# 
# Approach 1: Iterative
# 

# @param {TreeNode} root
# @return {Integer[]}
def preorder_traversal(root)
  return [] if root.nil?

  stack = [root]
  results = []

  until stack.empty?
    current_node = stack.pop
    results.push(current_node.val)

    stack.push(current_node.right) if current_node.right
    stack.push(current_node.left) if current_node.left
  end

  results
end

# 
# Approach 2: Recursive Ruby Solution
# 
# @param {TreeNode} root
# @return {Array[]}
def preorder_traversal(root)
  ans = []
  return ans if root == nil
  ans << root.val << preorder_traversal(root.left) << preorder_traversal(root.right)
  ans.flatten
end

# 
# Approach 3: Morris traversal
# 
# This approach is based on Morris's article which is intended to optimize the space
# complexity. The algorithm does not use additional space for the computation, and
# the memory is only used to keep the output. If one prints the output directly
# along the computation, the space complexity would be O(1).
#
# Algorithm
#
# Here the idea is to go down from the node to its predecessor, and each predecessor will be
# visited twice. For this go one step left if possible and then always right till the end.
# When we visit a leaf (node's predecessor) first time, it has a zero right child, so we
# update output and establish the pseudo link predecessor.right = root to mark the fact
# the predecessor is visited. When we visit the same predecessor the second time,
# it already points to the current node, thus we remove pseudo link and move right
# to the next node.
#
# If the first one step left is impossible, update output and move right to next node.

# Complexity Analysis

# Time complexity: we visit each predecessor exactly twice descending down from the node,
# thus the time complexity is O(N), where N is the number of nodes, i.e. the size of tree.

# Space complexity: we use no additional memory for the computation itself,
# but output list contains N elements, and thus space complexity is O(N).

# @param {TreeNode} root
# @return {Array[]}
def preorder_traversal(root)
  result = []
  iterator = root
  while iterator do
    if iterator.left.nil?
      result << iterator.val
      iterator = iterator.right
    else
      predecessor = find_predecessor(iterator)
      if predecessor.right.nil?
        result << iterator.val
        predecessor.right = iterator
        iterator = iterator.left
      else
        predecessor.right = nil
        iterator = iterator.right
      end
    end
  end
  result
end

def find_predecessor(node)
  current_node = node
  node = node.left
  while node.right and node.right != current_node do
    node = node.right
  end
  node
end
