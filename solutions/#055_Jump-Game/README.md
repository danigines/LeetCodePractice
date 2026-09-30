# 55. Jump Game

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![dynamic-programming](../../src/images/badges/topics/dynamic-programming.svg)](../../src/md/topics/Dynamic_Programming.md)
[![greedy](../../src/images/badges/topics/greedy.svg)](../../src/md/topics/Greedy.md)

You are given an integer array `nums`. You start at its first index, and each `nums[i]` represents the maximum distance you can jump forward from that position.

Return `true` if you can reach the last index, or `false` otherwise.

### Example 1
> **Input**: nums = [2,3,1,1,4]
>
> **Output**: true
>
> **Explanation**: Jump one step from index `0` to index `1`, then three steps to the last index.

### Example 2
> **Input**: nums = [3,2,1,0,4]
>
> **Output**: false
>
> **Explanation**: Every path reaches index `3`, whose maximum jump length is `0`, so the last index cannot be reached.

## Constraints
- `1 <= nums.length <= 10⁴`
- `0 <= nums[i] <= 10⁵`

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/jump-game/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/55/
