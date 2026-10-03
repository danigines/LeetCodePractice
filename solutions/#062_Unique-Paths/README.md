# 62. Unique Paths

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![math](../../src/images/badges/topics/math.svg)](../../src/md/topics/Math.md)
[![dynamic-programming](../../src/images/badges/topics/dynamic-programming.svg)](../../src/md/topics/Dynamic_Programming.md)
[![combinatorics](../../src/images/badges/topics/combinatorics.svg)](../../src/md/topics/Combinatorics.md)

A robot starts in the top-left corner of an `m × n` grid and must reach the bottom-right corner. At every step, it may move only right or down.

Given `m` and `n`, return the number of unique possible paths to the destination.

### Example 1
> ![Robot moving from start to finish through a grid](https://assets.leetcode.com/uploads/2018/10/22/robot_maze.png)
>
> **Input**: m = 3, n = 7
>
> **Output**: 28

### Example 2
> **Input**: m = 3, n = 2
>
> **Output**: 3
>
> **Explanation**: The three paths are:
>
> 1. Right → Down → Down
> 2. Down → Down → Right
> 3. Down → Right → Down

## Constraints
- `1 <= m, n <= 100`
- The answer is guaranteed to be at most `2 × 10⁹`.

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/unique-paths/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/62/
