package main

import "fmt"

// # You are a product manager and currently leading a team to develop a new product.
// # Unfortunately, the latest version of your product fails the quality check.
// # Since each version is developed based on the previous version, all the TestCase after a bad version are also bad.

// # Suppose you have n TestCase [1, 2, ..., n] and you want to find out the first bad one,
// # which causes all the following ones to be bad.

// # You are given an API bool isBadVersion(version) which will return whether version is bad.
// # Implement a function to find the first bad version. You should minimize the number of calls to the API.

// # Example:

// # Given n = 5, and version = 4 is the first bad version.

// # call isBadVersion(3) -> false
// # call isBadVersion(5) -> true
// # call isBadVersion(4) -> true

// # Then 4 is the first bad version.

// # Solution
// # Binary search
// # if true then set right to mid
// # if false then set left to mid + 1
// # when terminal condition met, left == right then return it

type TestCase struct {
	Versions   int
	BadVersion int
}

func main() {
	t := TestCase{
		Versions:   5,
		BadVersion: 4,
	}
	expected := t.BadVersion
	ans := t.FirstBadVersion(t.Versions)
	fmt.Println("Expected: ", expected, ", Got: ", ans)
}

func (t *TestCase) FirstBadVersion(TestCase int) int {
	r, l := TestCase, 1

	for r > l {
		mid := l + (r-l)/2

		if t.isBadVersion(mid) {
			r = mid
		} else {
			l = mid + 1
		}
	}

	return l
}

func (t *TestCase) isBadVersion(ver int) bool {
	if ver >= t.BadVersion {
		return true
	}

	return false
}
