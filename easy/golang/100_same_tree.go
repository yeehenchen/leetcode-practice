package main

import "fmt"

// Given two binary trees, write a function to check if they are the same or not.

// Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

// Example 1:

// Input:     1         1
//           / \       / \
//          2   3     2   3
//         [1,2,3],   [1,2,3]
// Output: true
// Example 2:

// Input:     1         1
//           /           \
//          2             2
//         [1,2],     [1,null,2]
// Output: false

// Solution:
// recursively check each node whether they're the same
type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func main() {
	left1 := &TreeNode{Val: 2}
	right1 := &TreeNode{Val: 3}
	root1 := &TreeNode{
		Val:   1,
		Left:  left1,
		Right: right1,
	}
	left2 := &TreeNode{Val: 2}
	right2 := &TreeNode{Val: 3}
	root2 := &TreeNode{
		Val:   1,
		Left:  left2,
		Right: right2,
	}
	expected := true
	ans := SameTree(root1, root2)
	fmt.Println("Expected: ", expected, ", Got: ", ans)

	left1 = &TreeNode{Val: 2}
	root1 = &TreeNode{
		Val:  1,
		Left: left1,
	}
	right2 = &TreeNode{Val: 2}
	root2 = &TreeNode{
		Val:   1,
		Right: right2,
	}
	expected = false
	ans = SameTree(root1, root2)
	fmt.Println("Expected: ", expected, ", Got: ", ans)
}

func SameTree(p *TreeNode, q *TreeNode) bool {
	if p == nil && q == nil {
		return true
	}
	if p == nil || q == nil {
		return false
	}
	if p.Val != q.Val {
		return false
	}

	return SameTree(p.Left, q.Left) && SameTree(p.Right, q.Right)
}
