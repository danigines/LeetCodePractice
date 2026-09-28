## Explanation [_Optimal solution_]

As in N-Queens, place one queen per row and represent attacked columns and diagonals with three bitmasks. The available positions in the current row are calculated at once:

``` swift
var available = fullMask & ~(columns | descendingDiagonals | ascendingDiagonals)
```

This problem only asks for the number of arrangements, so there is no need to build or copy any board. Reaching a state in which every column contains a queen contributes one valid solution.

The board is vertically symmetric. A queen placed in the left half of the first row has the same number of completions as its mirrored position in the right half. Search only the left half and double its count; when `n` is odd, search the center column separately.

### How to Recognize This Pattern

Consider **Backtracking with Bitmasks and Symmetry** when candidates belong to a small fixed domain and mirrored starting choices generate equally sized search spaces.

## Explanation [_Second solution_]

The second solution records occupied columns and diagonals in boolean arrays. Both diagonal families receive a unique non-negative index:

``` text
column:               column
descending diagonal: row - column + n - 1
ascending diagonal:  row + column
```

For each row, try every safe column, mark its three attack lines, and continue with the next row. After the recursive call, undo the marks so the next position can be explored. Completing all `n` rows increments the answer directly.

**Algorithm X** can model N-Queens as a generalized exact-cover problem. These implementations use direct backtracking because it expresses the constraints more simply for the given limit.

## Comparing solutions

| Aspect | Optimal solution: Symmetric Bitmasks | Second solution: Boolean Constraints |
|:-------|:------------------------------------:|:------------------------------------:|
| Advantages | Generates valid candidates with bit operations and avoids mirrored first-row searches. | Makes every occupied column and diagonal explicit. |
| Disadvantages | Combines bitwise operations with a symmetry argument. | Checks every column in each visited row and does not use symmetry. |
| When to use it | When only the count is required and performance matters. | When clarity is more important than constant-factor optimization. |
| Interview recommendation | Introduce basic backtracking first, then add bitmasks and symmetry. | A strong baseline that is easy to derive and verify. |

## Complexity comparison

Let `n` be the board size. The factorial bounds describe the worst-case backtracking search after enforcing one queen per row and column.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Symmetric Bitmasks | `O(n!)` | `O(n)` | The search considers only non-conflicting placements and symmetry removes about half of the first-row branches without changing the asymptotic bound. The recursion uses at most `n` stack frames. |
| Boolean Constraints | `O(n × n!)` | `O(n)` | Up to `n` columns are inspected at each partial placement. The three constraint arrays and recursion depth are linear in `n`. |
