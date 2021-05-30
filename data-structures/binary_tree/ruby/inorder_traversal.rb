# frozen_string_literal: true

# Given the root of a binary tree, return the inorder traversal of its nodes' values.

# Input: root = [1,null,2,3]
# Output: [1,3,2]

# Input: root = []
# Output: []

# Input: root = [1]
# Output: [1]

# Input: root = [1,2]
# Output: [2,1]

# Input: root = [1,null,2]
# Output: [1,2]

# Approach 1: Iterative

# Complexity Analysis

# Time complexity: O(n).
# Space complexity: O(n).

# @param {TreeNode} root
# @return {Integer[]}
def inorder_traversal(root)
  curr = root
  stack = []
  res = []

  until curr.nil? && stack.empty?
    while curr
      stack.push(curr)
      curr = curr.left
    end
    curr = stack.pop
    res << curr.val
    curr = curr.right
  end

  res
end

# Approach 2: Recursive

# Complexity Analysis

# Time complexity: O(n).
# The time complexity is O(n) because the recursive function is T(n)=2T(n/2)+1.

# Space complexity: The worst case space required is O(n), and in the average case
# it's O(log n) where nn is number of nodes.

# @param {TreeNode} root
# @return {Integer[]}
def inorder_traversal_recursive(root)
  response = []
  traverse(root, response)
  response
end

def traverse(node, response)
  return if node.nil?

  traverse(node.left, response) if node.left
  response << node.val
  traverse(node.right, response) if node.right
end

# Approach 3: Morris travel

# Complexity Analysis

# Time complexity: O(n). To prove that the time complexity is O(n),
# the biggest problem lies in finding the time complexity of finding the
# predecessor nodes of all the nodes in the binary tree. Intuitively, the
# complexity is O(n log n), because to find the predecessor node for a single
# node related to the height of the tree. But in fact, finding the predecessor
# nodes for all nodes only needs O(n) time. Because a binary Tree with n
# nodes has n-1 edges, the whole processing for each edges up to 2 times,
# one is to locate a node, and the other is to find the predecessor node.
# So the complexity is O(n).

# Space complexity: O(n). Arraylist of size n is used.

# @param {TreeNode} root
# @return {Integer[]}
def inorder_traversal(root)
  result = []
  iterator = root
  while iterator
    if iterator.left.nil?
      result << iterator.val
      iterator = iterator.right
    else
      predecessor = find_predecessor(iterator)
      if predecessor.right.nil?
        predecessor.right = iterator
        iterator = iterator.left
      else
        result << iterator.val
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
  node = node.right while node.right && (node.right != current_node)
  node
end
