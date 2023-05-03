# Given two binary trees and imagine that when you put one of them to cover the other,
# some nodes of the two trees are overlapped while the others are not.

# You need to merge them into a new binary tree. 
# The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node.
# Otherwise, the NOT null node will be used as the node of new tree.

# Example 1:

# Input: 
# 	Tree 1                     Tree 2                  
#           1                         2                             
#          / \                       / \                            
#         3   2                     1   3                        
#        /                           \   \                      
#       5                             4   7                  
# Output: 
# Merged tree:
# 	     3
# 	    / \
# 	   4   5
# 	  / \   \ 
# 	 5   4   7
 
# Note: The merging process must start from the root nodes of both trees.

# Solution
# traverse both trees
# if one tree's node is nil then return the orther tree's node
# add val of both trees if both nodes exists
def merge_trees(t1, t2)
  if t1.nil?
    return t2
  end
  
  if t2.nil?
    return t1
  end
  
  t1.left = merge_trees(t1.left, t2.left)
  t1.right = merge_trees(t1.right, t2.right)
  t1.val = t1.val + t2.val
  
  return t1
end