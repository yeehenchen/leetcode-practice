# Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

# (i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).

# Find the minimum element.

# The array may contain duplicates.

# Example 1:

# Input: [1,3,5]
# Output: 1
# Example 2:

# Input: [2,2,2,0,1]
# Output: 0
# Note:

# This is a follow up problem to Find Minimum in Rotated Sorted Array.
# Would allow duplicates affect the run-time complexity? How and why?

# Solution : Binary search
# case 1 : if mid > r --> update l = mid + 1
# case 2 : if mid < l --> update r = mid
# case 3 : others, mid = r--
def find_min(nums)
  l = 0
  r = nums.length - 1
  while l < r do
    mid = l + (r - l) / 2
    if nums[mid] > nums[r]
      l = mid + 1
    elsif nums[mid] < nums[l]
      r = mid
    else
      r-=1
    end
  end

  return nums[l]
end