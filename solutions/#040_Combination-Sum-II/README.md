# 40. Combination Sum II

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![backtracking](../../src/images/badges/topics/backtracking.svg)](../../src/md/topics/Backtracking.md)

Given a collection of candidate numbers (`candidates`) and a target number (`target`), find all unique combinations in `candidates` where the candidate numbers sum to `target`.

Each number in `candidates` may only be used **once** in a combination.

**Note:** The solution set must not contain duplicate combinations.

### Example 1
> **Input**: candidates = [10,1,2,7,6,1,5], target = 8
>
> **Output**:
>
> ``` text
> [
> [1,1,6],
> [1,2,5],
> [1,7],
> [2,6]
> ]
> ```

### Example 2
> **Input**: candidates = [2,5,2,1,2], target = 5
>
> **Output**:
>
> ``` text
> [
> [1,2,2],
> [5]
> ]
> ```

## Constraints
- `1 <= candidates.length <= 100`
- `1 <= candidates[i] <= 50`
- `1 <= target <= 30`

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/combination-sum-ii/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/40/
