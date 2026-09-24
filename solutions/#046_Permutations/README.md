# 46. Permutations

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![backtracking](../../src/images/badges/topics/backtracking.svg)](../../src/md/topics/Backtracking.md)

Given an array `nums` of distinct integers, return every possible permutation in any order.

### Example 1
> **Input**: nums = [1,2,3]
>
> **Output**:
>
> ``` text
> [
> [1,2,3],
> [1,3,2],
> [2,1,3],
> [2,3,1],
> [3,1,2],
> [3,2,1]
> ]
> ```

### Example 2
> **Input**: nums = [0,1]
>
> **Output**: [[0,1],[1,0]]

### Example 3
> **Input**: nums = [1]
>
> **Output**: [[1]]

## Constraints
- `1 <= nums.length <= 6`
- `-10 <= nums[i] <= 10`
- Every integer in `nums` is unique.

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/permutations/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/46/
