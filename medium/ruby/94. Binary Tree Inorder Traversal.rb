# Given the root of a binary tree, return the inorder traversal of its nodes' values.

# Constraints:
# The number of nodes in the tree is in the range [0, 100].
# -100 <= Node.val <= 100

# Recursive approach
def inorder_traversal(root)
  return [] if !root
  inorder_traversal(root.left) + [root.val] + inorder_traversal(root.right)
end

# Ietrative with Stack approach
def inorder_traversal(root)
  stack = []
  res = []
  while !root.nil? || !(stack.length == 0)
    while !root.nil?
      stack << root
      root = root.left
    end
    root = stack.pop
    res << root.val
    root = root.right
  end
  
  res
end

# Morris Traversal
# Step 1: Initialize current as root
# Step 2: While current is not NULL,

# If current does not have left child
#     a. Add current’s value
#     b. Go to the right, i.e., current = current.right
# Else
#     a. In current's left subtree, make current the right child of the rightmost node
#     b. Go to this left child, i.e., current = current.left
def inorder_traversal(root)
  res = []
  while !root.nil?
    if root.left.nil?
      res << root.val
      root = root.right
    else
      pre = root.left
      while !pre.right.nil?
          pre = pre.right
      end
      pre.right = root
      temp = root
      root = root.left
      temp.left = nil
    end
  end
  
  res
end
