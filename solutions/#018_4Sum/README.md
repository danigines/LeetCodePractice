# 18. 4Sum

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![two-pointers](../../src/images/badges/topics/two-pointers.svg)](../../src/md/topics/Two_Pointers.md)
[![sorting](../../src/images/badges/topics/sorting.svg)](../../src/md/topics/Sorting.md)

Given an array `nums` of `n` integers, return _an array of all the **unique** quadruplets_ `[nums[a], nums[b], nums[c], nums[d]]` such that:

- `0 <= a, b, c, d < n`
- `a`, `b`, `c`, and d are **distinct**.
- `nums[a] + nums[b] + nums[c] + nums[d] == target`
- You may return the answer in **any order**

### Example 1
> **Input**: nums = [1,0,-1,0,-2,2], target = 0
> 
> **Output**: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]

### Example 2
> **Input**: nums = [2,2,2,2,2], target = 8
> 
> **Output**: [[2,2,2,2]]

## Constraints
- `1 <= nums.length <= 200`
- `-10⁹ <= nums[i] <= 10⁹`
- `-10⁹ <= target <= 10⁹`

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/4sum/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/18/
