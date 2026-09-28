# 53. Maximum Subarray

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![divide-and-conquer](../../src/images/badges/topics/divide-and-conquer.svg)](../../src/md/topics/Divide_and_Conquer.md)
[![dynamic-programming](../../src/images/badges/topics/dynamic-programming.svg)](../../src/md/topics/Dynamic_Programming.md)

Given an integer array `nums`, find the contiguous subarray with the largest sum and return its sum.

### Example 1
> **Input**: nums = [-2,1,-3,4,-1,2,1,-5,4]
>
> **Output**: 6
>
> **Explanation**: The subarray `[4,-1,2,1]` has the largest sum, which is `6`.

### Example 2
> **Input**: nums = [1]
>
> **Output**: 1
>
> **Explanation**: The subarray `[1]` has the largest sum, which is `1`.

### Example 3
> **Input**: nums = [5,4,-1,7,8]
>
> **Output**: 23
>
> **Explanation**: The subarray `[5,4,-1,7,8]` has the largest sum, which is `23`.

## Constraints
- `1 <= nums.length <= 10⁵`
- `-10⁴ <= nums[i] <= 10⁴`

## Follow-up

After finding the `O(n)` solution, implement another solution using the more subtle divide and conquer approach.

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/maximum-subarray/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/53/
