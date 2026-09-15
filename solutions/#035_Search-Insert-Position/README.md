# 35. Search Insert Position

[![easy](../../src/images/badges/difficulty/easy.svg)](../../src/md/difficulty/easy.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![binary-search](../../src/images/badges/topics/binary-search.svg)](../../src/md/topics/Binary_Search.md)

Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

You must write an algorithm with `O(log n)` runtime complexity.

### Example 1
> **Input**: nums = [1,3,5,6], target = 5
>
> **Output**: 2

### Example 2
> **Input**: nums = [1,3,5,6], target = 2
>
> **Output**: 1

### Example 3
> **Input**: nums = [1,3,5,6], target = 7
>
> **Output**: 4

## Constraints
- `1 <= nums.length <= 10⁴`
- `-10⁴ <= nums[i] <= 10⁴`
- `nums` contains distinct values sorted in ascending order.
- `-10⁴ <= target <= 10⁴`

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/search-insert-position/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/35/
