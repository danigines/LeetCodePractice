# 70. Climbing Stairs

[![easy](../../src/images/badges/difficulty/easy.svg)](../../src/md/difficulty/easy.md)
[![math](../../src/images/badges/topics/math.svg)](../../src/md/topics/Math.md)
[![dynamic-programming](../../src/images/badges/topics/dynamic-programming.svg)](../../src/md/topics/Dynamic_Programming.md)
[![memoization](../../src/images/badges/topics/memoization.svg)](../../src/md/topics/Memoization.md)

You are climbing a staircase with `n` steps. Each move can climb either `1` or `2` steps.

Return the number of distinct ways to reach the top.

### Example 1
> **Input**: n = 2
>
> **Output**: 2
>
> **Explanation**: There are two ways:
>
> 1. 1 step + 1 step
> 2. 2 steps

### Example 2
> **Input**: n = 3
>
> **Output**: 3
>
> **Explanation**: There are three ways:
>
> 1. 1 step + 1 step + 1 step
> 2. 1 step + 2 steps
> 3. 2 steps + 1 step

## Constraints
- `1 <= n <= 45`

<details>
<summary>💡 Hint 1</summary>
To reach step `n`, consider which steps you could have occupied immediately before it, based on the allowed step sizes.
</details>

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/climbing-stairs/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/70/
