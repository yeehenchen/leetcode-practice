# Implement int sqrt(int x).

# Compute and return the square root of x, where x is guaranteed to be a non-negative integer.

# Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.

# Example 1:

# Input: 4
# Output: 2
# Example 2:

# Input: 8
# Output: 2
# Explanation: The square root of 8 is 2.82842..., and since 
#              the decimal part is truncated, 2 is returned.


# Solution
# binary search
# when terminate condition meets : left == right
# then return left - 1
def my_sqrt(x)
  return x if x < 2
  
  left = 1
  right = x
  while left < right
    mid = left + (right - left) / 2
    return mid if mid * mid == x
    
    if mid * mid > x
        right = mid
    else
        left = mid + 1
    end
  end
  
  right - 1
end