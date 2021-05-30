# Given an n-ary tree, return the level order traversal of its nodes' values.
#
# Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value.
#
# Example 1:
#
# Input: root = [1,null,3,2,4,null,5,6]
# Output: [[1],[3,2,4],[5,6]]
#
# Example 2:
#
# Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
# Output: [[1],[2,3,4,5],[6,7,8,9,10],[11,12,13],[14]]

#
# Approach 1: iterative
#

# Complexity Analysis
#
# Time complexity: O(n), where n is the number of nodes.
# Space complexity: O(n).

def level_order(root)
  result = []
  return result if root.nil?

  queue = []
  queue << root

  until queue.empty?
    level_size = queue.size
    level = []

    level_size.times do
      current_node = queue.shift
      level << current_node.val

      current_node.children.each do |child|
        queue << child unless child.nil?
      end
    end

    result << level
  end

  result
end
