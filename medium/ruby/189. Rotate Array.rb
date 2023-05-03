# Given an array, rotate the array to the right by k steps, where k is non-negative.

# Solution:
# 1. Brute force : rotate the whole array k times
# time complexity O(n x k), while n is the array length
# space complexity O(1), no extra space used
# *** Time Limit Exceeded
def rotate(nums, k)
  k %= nums.length

  k.times do
    pre = nums[nums.length - 1]
    for i in (0..nums.length - 1)
      temp = nums[i]
      nums[i] = pre
      pre = temp
    end
  end
end

# 2. Cyclic algorithm : move each element k space to right, when a cycle meets then move to next start point
# time complexity O(n), move each element once
# space complexity O(1), no extra space
def rotate(nums, k)
  k %= nums.length
  count = 0
  start = 0
  while count < nums.length
    current = start
    prev = nums[start]
    loop do
      _next = (current + k) % nums.length
      temp = nums[_next]
      nums[_next] = prev
      prev = temp
      current = _next
      count += 1
      break if start == current
    end
    start += 1
  end
end
