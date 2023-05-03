# Given an array of integers, find if the array contains any duplicates.

# Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.

# Solution
# 1. hashmap :
# time complexity O(n)
# space complexity O(n)
def contains_duplicate(nums)
  hash = {}
  nums.each do |num|
    return true if hash[num] && hash[num] > 0
    
    hash[num] ||= 0
    hash[num] += 1
  end
  
  return false
end

def contains_duplicate(nums)
  hash = {}
  nums.each do |num|
    return true if hash[num]
    
    hash[num] = 1
  end
  
  return false
end

def contains_duplicate(nums)
  hash = Hash.new(0)
  nums.each do |num|
    return true if hash[num] > 0
    
    hash[num] += 1
  end
  
  return false
end