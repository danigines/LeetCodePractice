# 77. Combinations

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![backtracking](../../src/images/badges/topics/backtracking.svg)](../../src/md/topics/Backtracking.md)

Given two integers `n` and `k`, return all possible combinations of `k` numbers chosen from the range `[1, n]`.

You may return the answer in any order.

### Example 1
> **Input**: n = 4, k = 2
>
> **Output**:
>
> ``` text
> [
> [1,2],
> [1,3],
> [1,4],
> [2,3],
> [2,4],
> [3,4]
> ]
> ```
>
> **Explanation**: There are `4 choose 2 = 6` total combinations. Combinations are unordered, so `[1,2]` and `[2,1]` represent the same combination.

### Example 2
> **Input**: n = 1, k = 1
>
> **Output**: [[1]]
>
> **Explanation**: There is `1 choose 1 = 1` total combination.

## Constraints
- `1 <= n <= 20`
- `1 <= k <= n`

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/combinations/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/77/
