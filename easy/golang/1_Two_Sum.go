package main

import "fmt"

// # Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
// # You may assume that each input would have exactly one solution, and you may not use the same element twice.
// # You can return the answer in any order.

// # Constraints:
// # 2 <= nums.length <= 105
// # -109 <= nums[i] <= 109
// # -109 <= target <= 109
// # Only one valid answer exists.

// # Solution: create a hashmap for looking up the value
// # check number in nums, if hashmap exists complement value then return their index.
func main() {
	arr := []int{1, 3, 45, 6, 4, 32, 5, 8}
	target := 13
	ans := TwoSum(arr, target)
	fmt.Println("Answer: [8 5], got: ", ans)
}

func TwoSum(nums []int, target int) []int {
	m := make(map[int]int)

	for i, val := range nums {
		comp := target - val
		if compI, ok := m[comp]; ok {
			return []int{i, compI}
		}
		m[val] = i
	}

	return nil
}
