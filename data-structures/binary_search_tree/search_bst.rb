# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

#
# Approach 1: Recursion
#

# Algorithm
#
# The recursion implementation is very straightforward:
#
# If the tree is empty root == null or the value to find is here val == root.val - return root.
# If val < root.val - go to search into the left subtree searchBST(root.left, val).
# If val > root.val - go to search into the right subtree searchBST(root.right, val).
#
# Return root.

# Complexity Analysis
#
# Time complexity: O(H), where H is a tree height. That results in O(log n) in
# the average case, and O(N) in the worst case.
#
# Space complexity: O(H) to keep the recursion stack, i.e. O(log n) in
# the average case, and O(N) in the worst case.

# @param {TreeNode} root
# @param {Integer} val
# @return {TreeNode}
def search_bst(root, val)
  if root.nil? || root.val == val
    return root
  end

  if val < root.val
    search_bst(root.left, val)
  else
    search_bst(root.right, val)
  end
end
