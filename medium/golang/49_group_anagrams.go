// https://leetcode.com/problems/group-anagrams/description/
// The idea is to sort each string first,
// anagram strings will have the same sorted result
// then make a hash to collect every anagram group
func groupAnagrams(strs []string) [][]string {
	m := make(map[string][]string)

	for _, s := range strs {
		byteS := []byte(s)
		sort.Slice(byteS, func(i, j int) bool { return byteS[i] < byteS[j] })
		sortedString := string(byteS)
		m[sortedString] = append(m[sortedString], s)
	}

	ret := make([][]string, 0)
	for _, val := range m {
		ret = append(ret, val)
	}

	return ret
}