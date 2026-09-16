# 39. Combination Sum

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![backtracking](../../src/images/badges/topics/backtracking.svg)](../../src/md/topics/Backtracking.md)

Given an array of distinct integers `candidates` and a target integer `target`, return a list of all unique combinations of `candidates` where the chosen numbers sum to `target`. You may return the combinations in any order.

The same number may be chosen from `candidates` an unlimited number of times. Two combinations are unique if the frequency of at least one chosen number is different.

The test cases are generated such that fewer than `150` unique combinations sum to `target` for a given input.

### Example 1
> **Input**: candidates = [2,3,6,7], target = 7
>
> **Output**: [[2,2,3],[7]]
>
> **Explanation**: `2 + 2 + 3 = 7`, and `7` itself also equals the target. These are the only two combinations.

### Example 2
> **Input**: candidates = [2,3,5], target = 8
>
> **Output**: [[2,2,2,2],[2,3,3],[3,5]]

### Example 3
> **Input**: candidates = [2], target = 1
>
> **Output**: []

## Constraints
- `1 <= candidates.length <= 30`
- `2 <= candidates[i] <= 40`
- All elements of `candidates` are distinct.
- `1 <= target <= 40`

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/combination-sum/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/39/
