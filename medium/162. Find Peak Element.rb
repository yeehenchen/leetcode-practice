# A peak element is an element that is greater than its neighbors.

# Given an input array nums, where nums[i] ≠ nums[i+1], find a peak element and return its index.

# The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.

# You may imagine that nums[-1] = nums[n] = -∞.

# Example 1:

# Input: nums = [1,2,3,1]
# Output: 2
# Explanation: 3 is a peak element and your function should return the index number 2.
# Example 2:

# Input: nums = [1,2,1,3,5,6,4]
# Output: 1 or 5 
# Explanation: Your function can return either index number 1 where the peak element is 2, 
#              or index number 5 where the peak element is 6.
# Follow up: Your solution should be in logarithmic complexity.

# Solution 1
def find_peak_element(nums)
  left = 0
  right = nums.length - 1
  
  while left <= right
    mid = (left + right) / 2
    lv = mid == 0 ? -99999999999 : nums[mid-1]
    rv = mid == nums.length-1 ? -9999999999 : nums[mid+1]
    return mid if lv < nums[mid] && nums[mid] > rv
    # 兩邊都大-> 走哪邊都行
    # 往左變大-> 更新 left
    # 往右變大 -> 更新 right
    if nums[mid-1] < nums[mid] && nums[mid] < nums[mid+1]
      left = mid + 1
    elsif nums[mid-1] > nums[mid] && nums[mid] > nums[mid+1]
      right = mid - 1
    else
      left = mid + 1         
    end
  end
  left - 1
end

# Solution 2
# easier logic
def find_peak_element(nums)
  l = 0
  r = nums.length - 1
  while l < r
    mid = (l + r) / 2
    if (nums[mid] > nums[mid + 1])
      r = mid
    else
      l = mid + 1
    end
  end
  return l
end