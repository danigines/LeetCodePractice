# 37. Sudoku Solver

[![hard](../../src/images/badges/difficulty/hard.svg)](../../src/md/difficulty/hard.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![hash-table](../../src/images/badges/topics/hash-table.svg)](../../src/md/topics/Hash_Table.md)
[![backtracking](../../src/images/badges/topics/backtracking.svg)](../../src/md/topics/Backtracking.md)
[![matrix](../../src/images/badges/topics/matrix.svg)](../../src/md/topics/Matrix.md)
[![algorithm-x](../../src/images/badges/topics/algorithm-x.svg)](../../src/md/topics/Algorithm_X.md)

Write a program to solve a Sudoku puzzle by filling the empty cells.

A Sudoku solution must satisfy all of the following rules:

1. Each of the digits `1-9` must occur exactly once in each row.
2. Each of the digits `1-9` must occur exactly once in each column.
3. Each of the digits `1-9` must occur exactly once in each of the nine `3 x 3` sub-boxes of the grid.

The `'.'` character indicates empty cells.

### Example 1
> ![src](https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Sudoku-by-L2G-20050714.svg/250px-Sudoku-by-L2G-20050714.svg.png)
> 
> **Input**: board =
>
> ``` text
> [["5","3",".",".","7",".",".",".","."],
>  ["6",".",".","1","9","5",".",".","."],
>  [".","9","8",".",".",".",".","6","."],
>  ["8",".",".",".","6",".",".",".","3"],
>  ["4",".",".","8",".","3",".",".","1"],
>  ["7",".",".",".","2",".",".",".","6"],
>  [".","6",".",".",".",".","2","8","."],
>  [".",".",".","4","1","9",".",".","5"],
>  [".",".",".",".","8",".",".","7","9"]]
> ```
>
> **Output**: board =
>
> ``` text
> [["5","3","4","6","7","8","9","1","2"],
>  ["6","7","2","1","9","5","3","4","8"],
>  ["1","9","8","3","4","2","5","6","7"],
>  ["8","5","9","7","6","1","4","2","3"],
>  ["4","2","6","8","5","3","7","9","1"],
>  ["7","1","3","9","2","4","8","5","6"],
>  ["9","6","1","5","3","7","2","8","4"],
>  ["2","8","7","4","1","9","6","3","5"],
>  ["3","4","5","2","8","6","1","7","9"]]
> ```
>
> **Explanation**: The input board has exactly one valid solution, shown above.
> 
> ![src](https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Sudoku-by-L2G-20050714_solution.svg/250px-Sudoku-by-L2G-20050714_solution.svg.png)

## Constraints
- `board.length == 9`
- `board[i].length == 9`
- `board[i][j]` is a digit or `'.'`.
- The input board is guaranteed to have exactly one solution.

<details>
<summary>💡 Hint 1</summary>
For each empty cell, try a digit that obeys the Sudoku rules, then attempt to solve the remaining cells.
</details>
<details>
<summary>💡 Hint 2</summary>
If a choice leads to a dead end, undo it and try another valid digit.
</details>

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/sudoku-solver/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/37/
