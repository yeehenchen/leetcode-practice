// leecode link: https://leetcode.com/problems/minimum-consecutive-cards-to-pick-up/description/

func minimumCardPickup(cards []int) int {
	res := -1
	cardMap := map[int]int{}
	for i, c := range cards {
			if val, ok := cardMap[c]; ok {
					if res == -1 {
							res = i - val + 1
					} else {
							res = min(res, i - val + 1)
					}
			}
			cardMap[c] = i
	}

	return res
}