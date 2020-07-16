# Implement pow(x, n), which calculates x raised to the power n (xn).

# Example 1:

# Input: 2.00000, 10
# Output: 1024.00000
# Example 2:

# Input: 2.10000, 3
# Output: 9.26100
# Example 3:

# Input: 2.00000, -2
# Output: 0.25000
# Explanation: 2-2 = 1/22 = 1/4 = 0.25
# Note:

# -100.0 < x < 100.0
# n is a 32-bit signed integer, within the range [−231, 231 − 1]

# Time Limit Exceeded Solution
# iterative approach
# if times is negative then turn x to 1/x & n to -n
# then multiply x each time
# => time limit exceeded
def my_pow(x, n)  
  ans = 1
  if n < 0
    x = 1 / x;  
    n = -n
  end
  
  n.times { ans *= x }
  
  ans
end

# Solution
# if times is negative, turn x to 1/x & n to -n first
# reduce the problem size by dividing the times by 2
# => x^50 = x^25 * x^25
# so no need to multiply 50 times
# at the end if its even then return recursive_result * recursive_result
#            if its odd then return recursive_result * recursive_result * x
def my_pow(x, n)
  return 1 if n == 0 
  return my_pow(1 / x, -n) if n < 0 
  pow = my_pow(x, n / 2)
  return pow * pow if n % 2 == 0 
  return pow * pow * x if n % 2 != 0 
end