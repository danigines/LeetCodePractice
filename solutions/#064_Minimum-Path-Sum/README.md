# 64. Minimum Path Sum

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![dynamic-programming](../../src/images/badges/topics/dynamic-programming.svg)](../../src/md/topics/Dynamic_Programming.md)
[![matrix](../../src/images/badges/topics/matrix.svg)](../../src/md/topics/Matrix.md)

Given an `m × n` grid filled with non-negative numbers, find a path from the top-left corner to the bottom-right corner that minimizes the sum of all numbers along the path.

At every step, you may move only right or down.

### Example 1
> ![Minimum path through a three-by-three grid](https://assets.leetcode.com/uploads/2020/11/05/minpath.jpg)
>
> **Input**: grid = [[1,3,1],[1,5,1],[4,2,1]]
>
> **Output**: 7
>
> **Explanation**: The path 1 → 3 → 1 → 1 → 1 produces the minimum sum.

### Example 2
> **Input**: grid = [[1,2,3],[4,5,6]]
>
> **Output**: 12

## Constraints
- `m == grid.count`
- `n == grid[row].count`
- `1 <= m, n <= 200`
- `0 <= grid[row][column] <= 200`

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/minimum-path-sum/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/64/
