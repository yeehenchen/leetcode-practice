# Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

# (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

# You are given a target value to search. If found in the array return its index, otherwise return -1.

# You may assume no duplicate exists in the array.

# Your algorithm's runtime complexity must be in the order of O(log n).

# Example 1:

# Input: nums = [4,5,6,7,0,1,2], target = 0
# Output: 4
# Example 2:

# Input: nums = [4,5,6,7,0,1,2], target = 3
# Output: -1

def search(nums, target)
  left = 0
  right = nums.length - 1
  
  while left <= right
    mid = left + (right - left) / 2
    return mid if target == nums[mid]
    
    # equality happens when mid point is left point
    if nums[mid] >= nums[left]
      # when left half is sorted
      # target > mid means all left values are smaller than target -> update left bound
      # target < left means all left values are greater than target
      # -> values smaller than left are on right side
      # -> update left bound
      # Otherwise target value should be in the sorted range [left, mid]
      # -> update right bound
      if target > nums[mid] || target < nums[left]
        left = mid + 1
      else
        right = mid - 1
      end
    else
      if target < nums[mid] || target > nums[right]
        right = mid - 1
      else
        left = mid + 1
      end
    end
  end

  -1 
end