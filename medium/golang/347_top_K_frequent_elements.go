// https://leetcode.com/problems/top-k-frequent-elements/description/
// #MaxHeap #PriorityQueue #QuickSelect

// mine solution (w/o data structures ==')
// time beats 5%, space beats 5%
func topKFrequent(nums []int, k int) []int {
	counts := make(map[int]int)
	for _, v := range nums {
		counts[v]++
	}

	freqs := make([][]int, len(nums)+1)
	for k, v := range freqs {
		arr[v] = append(arr[v], k)
	}

	ans := make([]int, 0)
	l := len(freqs) - 1
	for k > 0 && l >= 0 {
		if freqs[l] != nil {
			ans = append(ans, freqs[l]...)
			k -= len(freqs[l])
		}
		l--
	}

	return ans
}

// ------- MaxHeap solution -------
// ref: https://shubo.io/binary-heap/
func topKFrequent(nums []int, k int) (res []int) {
	m := make(map[int]int, 0)

	for i := 0; i < len(nums); i++ {
			if _, found := m[nums[i]]; found {
					m[nums[i]] += 1
			} else {
					m[nums[i]] = 1
			}
	}

	h := &KVHeap{}

	heap.Init(h)

	for k, v := range m {
			heap.Push(h, KV{
					k: k,
					v: v,
			})
	}

	for i := 0; i < k; i++ {
			t:= heap.Pop(h)
			res = append(res, t.(KV).k)
	}
	return res
}

/* Max Heap Implementation */
type KV struct {
	k int
	v int
}

type KVHeap []KV

func (kv KVHeap) Less(i int, j int) bool {
	return kv[i].v > kv[j].v
}

func (kv KVHeap) Swap(i int, j int) {
	kv[i], kv[j] = kv[j], kv[i]
}

func (kv KVHeap) Len() int {
	return len(kv)
}

func (kv *KVHeap) Push(v interface{}) {
	*kv = append(*kv, v.(KV))
}

func (kv *KVHeap) Pop() interface{} {
	old := *kv
	n := len(old)
	x := old[n-1]
	*kv = old[0:n-1]
	return x
}
// ------- MaxHeap solution -------

// ------- Quick Select solution -------
// ref: https://magiclen.org/quickselect/
func topKFrequent(nums []int, k int) []int {

  counts := make(map[int]int)
  for _, n := range nums {
    counts[n]++
  }

  frequencyPairs := [][2]int{}
  for num, count := range counts {
    frequencyPairs = append(frequencyPairs, [2]int{num, count})
  }

  frequencyPairs = quickSelect(
    frequencyPairs, 0, len(frequencyPairs) - 1, k-1)

  result := make([]int, 0, k)
  for _, pair := range frequencyPairs[:k] {
    result = append(result, pair[0])
  }

  return result
}

func quickSelect(arr [][2]int, l, r, k int) [][2]int {

  pivot := arr[r]
  j := l
  for i := l; i < r; i++ {
    // compare number counts/frequencies and swap
    if arr[i][1] >= pivot[1] {
      arr[i], arr[j] = arr[j], arr[i]
      j++
    }
  }
  arr[j], arr[r] = arr[r], arr[j]

  if j < k {
    return quickSelect(arr, j+1, r, k)
  }
  if j > k {
    return quickSelect(arr, l, j-1, k)
  }
  return arr
}
// ------- Quick Select solution -------

// ------- Priority Queue solution -------
import (
	"container/heap"
)

type Item struct {
	value int
	count int
}

type PriQ []*Item

// sort
// Less, Len, Swap
func (p PriQ) Less(i,j int) bool {
	return p[i].count > p[j].count
}

func (p PriQ) Len() int {
	return len(p)
}

func (p PriQ) Swap(i,j int) {
	p[i], p[j] = p[j], p[i]
}

// heap
// Pop, Push
func (p *PriQ) Pop() interface{} {
	// copy the q
	old := *p
	l := len(old)

	// get item from the top of the heap
	item := old[l-1]
	old[l-1] = nil // avoid mem leak

	// copy new old back into p
	*p = old[0:l-1]
	return item
}

func (p *PriQ) Push(x interface{}) {
	item := x.(*Item)
	*p = append(*p, item)
}

func topKFrequent(nums []int, k int) []int {
	items := make(map[int]int)
	for _, n := range nums {
			items[n]++
	}

	// Create a priority queue, put the items in it, and
	// establish the priority queue (heap) invariants.
	pq := make(PriQ, len(items))
	i := 0
	for value, count := range items {
		pq[i] = &Item{
			value: value,
			count: count,
		}
		i++
	}

	heap.Init(&pq)
	result := make([]int,0,k)
	// now grab top k items and bingo, bob's your uncle
	for i := k-1; i >=0; i-- {
		item := heap.Pop(&pq).(*Item)
		result = append(result,item.value)
	}

	return result
}
// ------- Priority Queue solution -------