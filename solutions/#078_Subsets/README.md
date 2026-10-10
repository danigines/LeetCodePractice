# 78. Subsets

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![backtracking](../../src/images/badges/topics/backtracking.svg)](../../src/md/topics/Backtracking.md)
[![bit-manipulation](../../src/images/badges/topics/bit-manipulation.svg)](../../src/md/topics/Bit_Manipulation.md)

Given an integer array `nums` of unique elements, return all possible subsets—the power set.

The solution set must not contain duplicate subsets. You may return the subsets in any order.

### Example 1
> **Input**: nums = [1,2,3]
>
> **Output**:
>
> ``` text
> [
> [],
> [1],
> [2],
> [1,2],
> [3],
> [1,3],
> [2,3],
> [1,2,3]
> ]
> ```

### Example 2
> **Input**: nums = [0]
>
> **Output**: [[],[0]]

## Constraints
- `1 <= nums.count <= 10`
- `-10 <= nums[index] <= 10`
- Every value in `nums` is unique.

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/subsets/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/78/
