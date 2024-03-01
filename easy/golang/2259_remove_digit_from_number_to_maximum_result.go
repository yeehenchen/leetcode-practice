// leetcode link: https://leetcode.com/problems/remove-digit-from-number-to-maximize-result/

func removeDigit(number string, digit byte) string {
	res := ""

	for i := 0; i < len(number); i++ {
			if number[i] == digit {
					if res == "" || number[:i] + number[i+1:] > res {
							res = number[:i] + number[i+1:]
					}
			}
	}

	return res
}