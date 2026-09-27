# 51. N-Queens

[![hard](../../src/images/badges/difficulty/hard.svg)](../../src/md/difficulty/hard.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![backtracking](../../src/images/badges/topics/backtracking.svg)](../../src/md/topics/Backtracking.md)
[![algorithm-x](../../src/images/badges/topics/algorithm-x.svg)](../../src/md/topics/Algorithm_X.md)

The **n-queens puzzle** asks you to place `n` queens on an `n × n` chessboard so that no two queens attack each other.

Given an integer `n`, return all distinct solutions to the **n-queens puzzle**. You may return the answer in any order.

Each solution contains a distinct board configuration, where `"Q"` represents a queen and `"."` represents an empty space.

### Example 1
> ![Two distinct solutions to the four-queens puzzle](https://assets.leetcode.com/uploads/2020/11/13/queens.jpg)
>
> **Input**: n = 4
>
> **Output**:
> ``` text
> [
> [".Q..","...Q","Q...","..Q."],
> ["..Q.","Q...","...Q",".Q.."]
> ]
> ```
>
> **Explanation**: There are two distinct solutions to the 4-queens puzzle.

### Example 2
> **Input**: n = 1
>
> **Output**: `[["Q"]]`

## Constraints
- `1 <= n <= 9`

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/n-queens/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/51/
