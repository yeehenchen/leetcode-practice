package main

import "fmt"

// # Given an array of integers, find if the array contains any duplicates.

// # Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.

// # Solution
// # hashmap :
// # time complexity O(n)
// # space complexity O(n)
func main() {
	nums1 := []int{1, 1, 2, 2, 3, 4, 4}
	ans := FindDuplicateByMap(nums1)
	expected := true
	fmt.Println("Expected: ", expected, ", Got: ", ans)

	nums2 := []int{1, 2, 3, 4}
	ans = FindDuplicateByMap(nums2)
	expected = false
	fmt.Println("Expected: ", expected, ", Got: ", ans)
}

func FindDuplicateByMap(nums []int) bool {
	m := make(map[int]bool)
	for _, v := range nums {
		if m[v] {
			return true
		} else {
			m[v] = true
		}
	}

	return false
}
