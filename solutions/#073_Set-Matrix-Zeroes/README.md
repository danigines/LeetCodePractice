# 73. Set Matrix Zeroes

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![hash-table](../../src/images/badges/topics/hash-table.svg)](../../src/md/topics/Hash_Table.md)
[![matrix](../../src/images/badges/topics/matrix.svg)](../../src/md/topics/Matrix.md)

Given an `m x n` integer matrix, if an element is `0`, set its entire row and column to `0`.

You must do it [**in-place**](https://en.wikipedia.org/wiki/In-place_algorithm).

### Example 1
![Example 1](https://assets.leetcode.com/uploads/2020/08/17/mat1.jpg)

> **Input**: matrix = [[1,1,1],[1,0,1],[1,1,1]]
>
> **Output**: [[1,0,1],[0,0,0],[1,0,1]]

### Example 2
![Example 2](https://assets.leetcode.com/uploads/2020/08/17/mat2.jpg)

> **Input**: matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
>
> **Output**: [[0,0,0,0],[0,4,5,0],[0,3,1,0]]

## Constraints
- `m == matrix.count`
- `n == matrix[0].count`
- `1 <= m, n <= 200`
- `-2³¹ <= matrix[row][column] <= 2³¹ - 1`

## Follow-up
- A straightforward solution using `O(m × n)` space is probably a bad idea.
- A simple improvement uses `O(m + n)` space, but it is not the best solution.
- Can you devise a constant-space solution?

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/set-matrix-zeroes/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/73/
