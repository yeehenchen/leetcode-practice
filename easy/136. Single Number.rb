# Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

# Solution:
# 1. hashmap
# time complexity O(n)
# space complexity O(n)
def single_number(nums)
  hash = {}
  
  nums.each do |num|
    hash[num] = (hash[num] || 0) + 1 
  end
  
  hash.each do |k, v|
    return k if v == 1
  end
end

# 2. bit operation : XOR
def single_number(nums)
  res = 0
  nums.each do |num|
    res ^= num
  end

  res
end

def single_number(nums)
  nums.reduce(:^)
end