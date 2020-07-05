# Given the root node of a binary search tree, return the sum of values of all nodes with value between L and R (inclusive).

# The binary search tree is guaranteed to have unique values.

 

# Example 1:

# Input: root = [10,5,15,3,7,null,18], L = 7, R = 15
# Output: 32
# Example 2:

# Input: root = [10,5,15,3,7,13,18,1,null,6], L = 6, R = 10
# Output: 23
 

# Note:

# The number of nodes in the tree is at most 10000.
# The final answer is guaranteed to be less than 2^31.

# Solution 1
# Recursive  for traversing all nodes in the tree
# add node's value if meet the condition, otherwise continue travsersing
def range_sum_bst(root, l, r)
  return 0 if !root
  if root.val >= l && root.val <= r
      return root.val + range_sum_bst(root.left, l, r) + range_sum_bst(root.right, l, r)
  else
      return range_sum_bst(root.left, l, r) + range_sum_bst(root.right, l, r)
  end
end