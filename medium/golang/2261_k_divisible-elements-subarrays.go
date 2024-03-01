// leetcode link: https://leetcode.com/problems/k-divisible-elements-subarrays/

// recursive function to find all subarrays
func countDistinct(nums []int, k int, p int) int {
	divisible := make([]bool, len(nums))
	for i := 0; i < len(nums); i++ {
		divisible[i] = nums[i]%p == 0
	}

	res := 0
	seen := make(map[string]bool, 0)

	// iter function to find all subarrays
	var iter func(start int, currK int, subarray []rune)
	iter = func(start int, currK int, subarray []rune) {
		if len(subarray) > 0 && currK <= k {
			if _, exists := seen[string(subarray)]; !exists {
					res += 1
			}
		}

		if currK > k || start == len(nums) {
			return
		}

		if divisible[start] {
			currK++
		}

		if len(subarray) > 0 {
			seen[string(subarray)] = true
		}

		subarray = append(subarray, rune(nums[start]))

		iter(start+1, currK, subarray)
	}

	for i := 0; i < len(nums); i++ {
		iter(i, 0, nil)
	}
	return res
}

// use memo to store all subarrays
// and use string as key to store in map
// note that strings should be separated by "/" to avoid collision
func countDistinct(nums []int, k int, p int) int {
	memo := make(map[string]bool)
	n := len(nums)

	for i := 0; i < n; i++ {
			divisible := 0

			var s string
			for j := i; j < n; j++ {
					if nums[j] % p == 0 {
							divisible++
					}
					if divisible > k {
							break
					}
					s += "/"+strconv.Itoa(nums[j])
					memo[s] = true
			}
	}
	return len(memo)
}