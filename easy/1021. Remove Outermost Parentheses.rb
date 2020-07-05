# A valid parentheses string is either empty (""), "(" + A + ")", or A + B, where A and B are valid parentheses strings,
# and + represents string concatenation.
# For example, "", "()", "(())()", and "(()(()))" are all valid parentheses strings.

# A valid parentheses string S is primitive if it is nonempty, and there does not exist a way to split it into S = A+B,
# with A and B nonempty valid parentheses strings.

# Given a valid parentheses string S, consider its primitive decomposition: S = P_1 + P_2 + ... + P_k,
# where P_i are primitive valid parentheses strings.

# Return S after removing the outermost parentheses of every primitive string in the primitive decomposition of S.

# Example 1:

# Input: "(()())(())"
# Output: "()()()"
# Explanation: 
# The input string is "(()())(())", with primitive decomposition "(()())" + "(())".
# After removing outer parentheses of each part, this is "()()" + "()" = "()()()".
# Example 2:

# Input: "(()())(())(()(()))"
# Output: "()()()()(())"
# Explanation: 
# The input string is "(()())(())(()(()))", with primitive decomposition "(()())" + "(())" + "(()(()))".
# After removing outer parentheses of each part, this is "()()" + "()" + "()(())" = "()()()()(())".
# Example 3:

# Input: "()()"
# Output: ""
# Explanation: 
# The input string is "()()", with primitive decomposition "()" + "()".
# After removing outer parentheses of each part, this is "" + "" = "".
 

# Note:

# S.length <= 10000
# S[i] is "(" or ")"
# S is a valid parentheses string

# Solution:
# if it's primitive, no. of left parentheses would equal no. right parentheses
# then add the substring to result
def remove_outer_parentheses(s)
  c_l = 0
  c_r = 0
  c = 0
  o = ''
  for i in 0..(s.length - 1)
    s[i] == "(" ? c_l += 1 : c_r += 1
    if c_l == c_r
        o << s[c+1...i]
        c = i + 1
        c_l = c_r = 0
    end
  end
  o
end