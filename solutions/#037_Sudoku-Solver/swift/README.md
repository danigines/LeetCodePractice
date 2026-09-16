## Explanation [_Optimal solution_]

This is a **backtracking** problem: place a legal digit, continue with the remaining empty cells, and undo that placement if it leads to a dead end.

The primary solution keeps three arrays of bitmasks, one for rows, one for columns, and one for `3 x 3` boxes. Each bit represents a digit from `1` to `9`.

``` text
digit: 1 2 3 4 5 6 7 8 9
bit:   0 1 2 3 4 5 6 7 8
```

### How are candidates found?

For an empty cell, combine the bits already used in its row, column, and box. The remaining bits are its legal digits:

``` swift
let candidates = 0x1FF & ~(rowMasks[row] | columnMasks[column] | boxMasks[box])
```

`0x1FF` has exactly nine active bits, so the result contains only digits `1...9`.

### Why choose the cell with the fewest candidates?

At each recursive step, the solution checks all empty cells and chooses the most constrained one. A cell with one candidate forces the next move; a cell with no candidates proves that the current path cannot succeed.

This **minimum remaining values** heuristic usually avoids many unnecessary branches. It does not change the exponential worst-case guarantee.

### How does backtracking restore the board?

After placing a digit, its bit is recorded in the three corresponding masks. If the recursive attempt fails, both the cell and those bits are restored:

``` swift
board[bestRow][bestColumn] = "."
rowMasks[bestRow] &= ~bit
columnMasks[bestColumn] &= ~bit
boxMasks[box] &= ~bit
```

If there are no empty cells left, the puzzle is solved and recursion returns `true` without undoing the successful path.

### How to Recognize This Pattern

Think of **Constraint-Based Backtracking** when:

- each decision has several candidates
- a choice can be validated against local constraints
- a failed choice can be undone
- choosing the most restricted variable may reduce the search tree

## Explanation [_Second solution_]

The direct solution finds the first empty cell in row-major order. It tries digits `1...9`, checking the entire row, column, and box before each placement.

``` text
find an empty cell → try a valid digit → recurse
                                      ↳ if it fails, erase and try another
```

It does not maintain extra membership tables or choose a special next cell. This makes the logic easy to trace, but it may repeat the same checks and explore many more branches.

### What changes compared to the optimal solution?

Both solutions modify the input board in-place and stop at the first complete solution. The primary solution tracks used digits with masks and selects the emptiest cell with the fewest candidates. The second solution uses direct scans and a fixed cell order.

## Comparing solutions

| Aspect | Optimal solution: Masks and Fewest Candidates | Second solution: Direct Backtracking |
|:-------|:---------------------------------------------:|:------------------------------------:|
| Advantages | Fast membership checks and fewer branches in typical puzzles. | Straightforward validation and recursion. |
| Disadvantages | More bookkeeping and a full scan to select each next cell. | Repeats row, column, and box checks; fixed order may branch heavily. |
| When to use it | When solving harder puzzles efficiently. | When learning or explaining the basic backtracking pattern. |
| Interview recommendation | Explain the direct version first, then optimize with masks and the candidate-count heuristic. | A good correct baseline. |

## Complexity comparison

Let `E` be the number of empty cells. The board size is fixed at `9 x 9`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Masks and Fewest Candidates | `O(81 × 9^E)` worst case | `O(81 + E)` | Up to nine branches per empty cell; selecting a cell scans at most 81 positions. Masks and the recursion stack hold fixed board metadata and up to `E` frames. |
| Direct Backtracking | `O(81 × 9^E)` worst case | `O(E)` | Up to nine choices per empty cell, with constant-size row, column, and box scans for each candidate. Recursion uses up to `E` frames. |

The primary solution generally explores fewer states, but neither technique guarantees polynomial time.
