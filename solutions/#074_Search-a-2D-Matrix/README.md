# 74. Search a 2D Matrix

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![binary-search](../../src/images/badges/topics/binary-search.svg)](../../src/md/topics/Binary_Search.md)
[![matrix](../../src/images/badges/topics/matrix.svg)](../../src/md/topics/Matrix.md)

You are given an `m x n` integer matrix `matrix` with the following two properties:

- Each row is sorted in non-decreasing order.
- The first integer of each row is greater than the last integer of the previous row.

Given an integer `target`, return `true` if `target` is in `matrix` or `false` otherwise.

You must write a solution in `O(log(m × n))` time complexity.

### Example 1
![Example 1](https://assets.leetcode.com/uploads/2020/10/05/mat.jpg)

> **Input**: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
>
> **Output**: true

### Example 2
![Example 2](https://assets.leetcode.com/uploads/2020/10/05/mat2.jpg)

> **Input**: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
>
> **Output**: false

## Constraints
- `m == matrix.count`
- `n == matrix[row].count`
- `1 <= m, n <= 100`
- `-10⁴ <= matrix[row][column], target <= 10⁴`

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/search-a-2d-matrix/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/74/
