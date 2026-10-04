# 63. Unique Paths II

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![dynamic-programming](../../src/images/badges/topics/dynamic-programming.svg)](../../src/md/topics/Dynamic_Programming.md)
[![matrix](../../src/images/badges/topics/matrix.svg)](../../src/md/topics/Matrix.md)

A robot starts in the top-left corner of an `m × n` grid and must reach the bottom-right corner. At every step, it may move only right or down.

Some cells contain obstacles. Given the integer matrix `obstacleGrid`, where `1` represents an obstacle and `0` represents an empty cell, return the number of unique paths that avoid every obstacle.

### Example 1
> ![Two valid paths around an obstacle in a three-by-three grid](https://assets.leetcode.com/uploads/2020/11/04/robot1.jpg)
>
> **Input**: obstacleGrid = [[0,0,0],[0,1,0],[0,0,0]]
>
> **Output**: 2
>
> **Explanation**: There is one obstacle in the middle of the grid. The two valid paths are:
>
> 1. Right → Right → Down → Down
> 2. Down → Down → Right → Right

### Example 2
> ![The only valid path around an obstacle in a two-by-two grid](https://assets.leetcode.com/uploads/2020/11/04/robot2.jpg)
>
> **Input**: obstacleGrid = [[0,1],[0,0]]
>
> **Output**: 1

## Constraints
- `m == obstacleGrid.count`
- `n == obstacleGrid[row].count`
- `1 <= m, n <= 100`
- `obstacleGrid[row][column]` is `0` or `1`.
- The answer is guaranteed to be at most `2 × 10⁹`.

<details>
<summary>💡 Hint 1</summary>
Use dynamic programming because every open cell can be reached only from above or from the left.
</details>
<details>
<summary>💡 Hint 2</summary>
Let <code>dp[row][column]</code> be the number of paths to a cell. For an open cell, add the values from above and from the left; for an obstacle, set its value to zero.
</details>

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/unique-paths-ii/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/63/
