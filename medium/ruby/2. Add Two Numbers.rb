# You are given two non-empty linked lists representing two non-negative integers. 
# The digits are stored in reverse order, and each of their nodes contains a single digit.
# Add the two numbers and return the sum as a linked list.
# You may assume the two numbers do not contain any leading zero, except the number 0 itself.

# Constraints:
# The number of nodes in each linked list is in the range [1, 100].
# 0 <= Node.val <= 9
# It is guaranteed that the list represents a number that does not have leading zeros.

# Solution: Because it's reverse order, so we can perform addition for two lists
# number of tens will be passed to next recursive loop.
# & save operator to prevent list ends, e.g. 12 & 123
def add_two_numbers(l1, l2, ten = 0)
  return nil if(l1.nil? && l2.nil? && ten.zero?)
  sum = (l1&.val || 0) + (l2&.val || 0) + ten
  return ListNode.new(sum % 10).tap do |l|
      l.next = add_two_numbers(l1&.next, l2&.next, sum / 10)
  end
end