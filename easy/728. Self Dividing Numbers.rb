# A self-dividing number is a number that is divisible by every digit it contains.

# For example, 128 is a self-dividing number because 128 % 1 == 0, 128 % 2 == 0, and 128 % 8 == 0.

# Also, a self-dividing number is not allowed to contain the digit zero.

# Given a lower and upper number bound, output a list of every possible self dividing number, including the bounds if possible.

# Example 1:
# Input: 
# left = 1, right = 22
# Output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15, 22]
# Note:

# The boundaries of each input argument are 1 <= left <= right <= 10000.

# Solution 1
# Brute force,  test each number if it's self dividing
def self_dividing_numbers(left, right)
  res = []
  for i in left..right
    c = 0
    for d in i.to_s.chars
      d.to_i != 0 ? (c += i % d.to_i) : (c += 1)
    end
    res.push(i) if c == 0
  end
  res
end

# Solution2
# instead of strings, use % to get each digit of the number
def self_dividing_numbers(left, right)
  res = []
  for i in left..right
    last_digit = i % 10
    temp = i
    while temp != 0 && last_digit != 0 && i % last_digit == 0
      temp /= 10
      last_digit = temp % 10
    end

    res << i if temp == 0
  end
  res
end