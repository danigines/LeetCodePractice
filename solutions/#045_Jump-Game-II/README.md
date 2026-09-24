# 45. Jump Game II

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![dynamic-programming](../../src/images/badges/topics/dynamic-programming.svg)](../../src/md/topics/Dynamic_Programming.md)
[![greedy](../../src/images/badges/topics/greedy.svg)](../../src/md/topics/Greedy.md)

You are given a 0-indexed integer array `nums` and start at index `0`. Each `nums[i]` is the maximum distance you may jump forward from index `i`.

Return the minimum number of jumps needed to reach index `n - 1`. Every test case guarantees that the last index is reachable.

### Example 1
> **Input**: nums = [2,3,1,1,4]
>
> **Output**: 2
>
> **Explanation**: Jump from index `0` to index `1`, then from index `1` to the last index.

### Example 2
> **Input**: nums = [2,3,0,1,4]
>
> **Output**: 2

## Constraints
- `1 <= nums.length <= 10⁴`
- `0 <= nums[i] <= 1000`
- The last index is always reachable.

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/jump-game-ii/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/45/
