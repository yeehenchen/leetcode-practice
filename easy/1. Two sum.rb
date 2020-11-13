# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
# You can return the answer in any order.

# Constraints:
# 2 <= nums.length <= 105
# -109 <= nums[i] <= 109
# -109 <= target <= 109
# Only one valid answer exists.

# Solution: create a hashmap for looking up the value
# check number in nums, if hashmap exists complement value then return their index.
def two_sum(nums, target)
  h = Hash.new

  nums.each_with_index do |v, i|
    complement = target - v
    return [h[complement], i] if h[complement]
    h[v] = i
  end
end
