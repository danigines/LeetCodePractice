# 80. Remove Duplicates from Sorted Array II

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![two-pointers](../../src/images/badges/topics/two-pointers.svg)](../../src/md/topics/Two_Pointers.md)

Given an integer array `nums` sorted in **non-decreasing order**, remove some duplicates [**in-place**](https://en.wikipedia.org/wiki/In-place_algorithm) such that each unique element appears **at most twice**. The **relative order** of the elements should be kept the **same**.

Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the **first part** of the array `nums`. More formally, if there are `k` elements after removing the duplicates, then the first `k` elements of `nums` should hold the final result. It does not matter what you leave beyond the first `k` elements.

Return `k` after placing the final result in the first `k` slots of `nums`.

Do **not** allocate extra space for another array. You must do this by **modifying the input array** [**in-place**](https://en.wikipedia.org/wiki/In-place_algorithm) with `O(1)` extra memory.

### Custom Judge
The judge validates the returned length and only the first `k` positions:

``` swift
var nums = input
let expectedNums = expected

let k = Solution().removeDuplicates(&nums)

assert(k == expectedNums.count)

for index in 0..<k {
    assert(nums[index] == expectedNums[index])
}
```

If all assertions pass, the solution is accepted.

### Example 1
> **Input**: nums = [1,1,1,2,2,3]
>
> **Output**: 5, nums = [1,1,2,2,3,_]
>
> **Explanation**: Return `k = 5`. The first five values are `1`, `1`, `2`, `2`, and `3`. The value after `k` does not matter.

### Example 2
> **Input**: nums = [0,0,1,1,1,1,2,3,3]
>
> **Output**: 7, nums = [0,0,1,1,2,3,3,_,_]
>
> **Explanation**: Return `k = 7`. The first seven values are `0`, `0`, `1`, `1`, `2`, `3`, and `3`. The values after `k` do not matter.

## Constraints
- `1 <= nums.count <= 3 × 10⁴`
- `-10⁴ <= nums[index] <= 10⁴`
- `nums` is sorted in non-decreasing order.

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/80/
