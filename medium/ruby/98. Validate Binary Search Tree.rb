# Given a binary tree, determine if it is a valid binary search tree (BST).

# Assume a BST is defined as follows:

# The left subtree of a node contains only nodes with keys less than the node's key.
# The right subtree of a node contains only nodes with keys greater than the node's key.
# Both the left and right subtrees must also be binary search trees.

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Boolean}

# Solution : keep updating [lb, ub] and traverse the tree to see if all nodes meet the condition.
# current node's value should be the ub of left subtree & lb of the right subtree.

# Note: check if lb, ub is nil, other wise cannot do comparison.
def is_valid_bst(root, lb=nil, ub=nil)
  return true if root.nil?
  return false if !lb.nil? && root.val <= lb
  return false if !ub.nil? && root.val >= ub
  
  is_valid_bst(root.left, lb, root.val) && is_valid_bst(root.right, root.val, ub)
end

# Initialize with minimum and maximum value to avoid nil values.
# Ruby doesn't have minimum / maximum integer.
def is_valid_bst(root, lb=-2147483649, ub=2147483649)
  return true if root.nil?
  return false if root.val <= lb || root.val >= ub
  
  is_valid_bst(root.left, lb, root.val) && is_valid_bst(root.right, root.val, ub)
end
