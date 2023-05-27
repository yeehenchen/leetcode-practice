package main

import "fmt"

// # Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

// # Solution:
// # 1. hashmap
// # time complexity O(n)
// # space complexity O(n)
// # 2. bit operation : XOR
func main() {
	nums1 := []int{1, 1, 2, 2, 3, 4, 4}
	ans := FindSingleNumByMap(nums1)
	expected := 3
	fmt.Println("Expected: ", expected, ", Got: ", ans)
	ans = FindSingleNumByXOR(nums1)
	fmt.Println("Expected: ", expected, ", Got: ", ans)
}

func FindSingleNumByMap(nums []int) int {
	m := make(map[int]int)
	for _, v := range nums {
		m[v] += 1
	}

	for k, v := range m {
		if v == 1 {
			return k
		}
	}

	return 0
}

func FindSingleNumByXOR(nums []int) int {
	ret := 0
	for _, v := range nums {
		ret = ret ^ v
	}

	return ret
}
