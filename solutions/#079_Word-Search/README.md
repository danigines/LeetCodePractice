# 79. Word Search

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![string](../../src/images/badges/topics/string.svg)](../../src/md/topics/String.md)
[![backtracking](../../src/images/badges/topics/backtracking.svg)](../../src/md/topics/Backtracking.md)
[![depth-first-search](../../src/images/badges/topics/depth-first-search.svg)](../../src/md/topics/Depth_First_Search.md)
[![matrix](../../src/images/badges/topics/matrix.svg)](../../src/md/topics/Matrix.md)

Given an `m x n` grid of characters `board` and a string `word`, return `true` if `word` exists in the grid.

The word can be constructed from letters in sequentially adjacent cells. Adjacent cells are horizontal or vertical neighbors, and the same cell may not be used more than once.

### Example 1
![Example 1](https://assets.leetcode.com/uploads/2020/11/04/word2.jpg)

> **Input**: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
>
> **Output**: true

### Example 2
![Example 2](https://assets.leetcode.com/uploads/2020/11/04/word-1.jpg)

> **Input**: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
>
> **Output**: true

### Example 3
![Example 3](https://assets.leetcode.com/uploads/2020/10/15/word3.jpg)

> **Input**: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
>
> **Output**: false

## Constraints
- `m == board.count`
- `n == board[row].count`
- `1 <= m, n <= 6`
- `1 <= word.count <= 15`
- `board` and `word` contain only lowercase and uppercase English letters.

## Follow-up
Could you use search pruning to make your solution faster with a larger `board`?

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/word-search/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/79/
