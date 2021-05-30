# Insert into a Binary Search Tree

# You are given the root node of a binary search tree (BST) and a value to
# insert into the tree. Return the root node of the BST after the insertion.
# It is guaranteed that the new value does not exist in the original BST.

# Notice that there may exist multiple valid ways for the insertion,
# as long as the tree remains a BST after insertion. You can return any of them.

# Example 1:
#
# Input: root = [4,2,7,1,3], val = 5
# Output: [4,2,7,1,3,5]
# Explanation: Another accepted tree is:
#
# Example 2:
#
# Input: root = [40,20,60,10,30,50,70], val = 25
# Output: [40,20,60,10,30,50,70,null,null,25]
#
# Example 3:
#
# Input: root = [4,2,7,1,3,null,null,null,null,null,null], val = 5
# Output: [4,2,7,1,3,5]

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# Intuition

# One of the huge BST advantages is a search for arbitrary element in O(log N)
# time. Here we'll see that the insert time is O(log N), too, in the average case.
# The problem solution is very simple - one could always insert new node as a
# child of the leaf. To define which leaf to use, one could follow the standard BST logic:

# If val > node.val - go to insert into the right subtree.
# If val < node.val - go to insert into the left subtree.
#

#
# Approach 1: Recursion
#

# The recursion implementation is very straightforward:
#
# If root is null - return TreeNode(val).
#
# If val > root.val - go to insert into the right subtree.
# If val < root.val - go to insert into the left subtree.
#
# Return root.

# Complexity Analysis

# Time complexity: O(H), where HH is a tree height. That results in O(log N) in the
# average case, and O(N) in the worst case.

# Space complexity: O(H) to keep the recursion stack, i.e. O(log N)
# in the average case, and O(N) in the worst case.

# @param {TreeNode} root
# @param {Integer} val
# @return {TreeNode}
def insert_into_bst(root, val)
  return TreeNode.new(val) if root.nil?

  if val < root.val
    root.left = insert_into_bst(root.left, val)
  else
    root.right = insert_into_bst(root.right, val)
  end

  root
end

#
# Approach 2: Iteration
#

# The recursion above could be converted into the iteration

# Complexity Analysis

# Time complexity: O(H), where H is a tree height. That results
# in O(log N) in the average case, and O(N) in the worst case.

# Space complexity: O(1) since it's a constant space solution.

def insert_into_bst(root, val)
  node = root

  while node
    # insert into the right subtree
    if val > node.val
      # insert right now
      if not node.right
        node.right = TreeNode.new(val)
        return root
      else
        node = node.right
      end
    # insert into the left subtree
    else
      # insert right now
      if not node.left
        node.left = TreeNode.new(val)
        return root
      else
        node = node.left
      end
    end
  end

  TreeNode.new(val)
end
