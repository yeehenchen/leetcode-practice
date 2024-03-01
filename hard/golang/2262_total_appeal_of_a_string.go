// leetcode link: https://leetcode.com/problems/total-appeal-of-a-string/

// record eacch character's latest position
// then calculate the sum of all the positions
// for each character in the string
func appealSum(s string) int64 {
	m := [26]int{}
	var res int
for i, c := range s {
			pos := c - 'a'
			m[pos] = i+1
			for _, j := range m {
					res += j
			}
	}

return int64(res)
}

// when add a new character, the sum of all the positions
// will increase by the number of characters between the new
// character and the last position of the same character plus itself
func appealSum(s string) int64 {
	var res int

	m := [26]int{}
	for i := range m {
			m[i] = -1
	}

	charCount := 0
	for i := range s {
				charCount += i - m[s[i]-'a']
				res += charCount
				m[s[i]-'a'] = i
		}

	return int64(res)
}