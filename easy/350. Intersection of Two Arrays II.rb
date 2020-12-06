# Given two arrays, write a function to compute their intersection.

# Solution
# 1. hashmap
# time complexity O(m + n), loop through two arrays
# space complexity O(n), make one extra hash and return array
def intersect(nums1, nums2)
  hash = {}
  if nums1.length > nums2.length 
      store = nums2 
      compute = nums1
  else
      store = nums1
      compute = nums2
  end
    
  store.each do |num|
    hash[num] = (hash[num] || 0) + 1 
  end
  
  res = []
  compute.each do |num|
    next if !hash[num]
    if hash[num] > 0
      res << num
      hash[num] -= 1
    end
  end
  
  res
end

# 2. Sort and two pointers
# If two arrays are sorted, use two pointers in each array
# if loop through either whole array, function ends
# if one pointer is less than the other, move if to next step
# if intersection is found, move both pointers
# time complexity O(n)
# space complexity O(n)
def intersect(nums1, nums2)
  nums1.sort!
  nums2.sort!
  
  i = 0
  j = 0
  intersection = []
  while true
    break if nums1.size == i || nums2.size == j
    if nums1[i] > nums2[j]
      j += 1
    elsif nums1[i] < nums2[j]
      i += 1
    else
      intersection << nums1[i]
      i += 1
      j += 1
    end
  end
  
  intersection
end
