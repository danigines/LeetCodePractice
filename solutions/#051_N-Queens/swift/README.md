## Explanation [_Optimal solution_]

Place exactly one queen in each row. Three bitmasks record the columns and diagonals attacked in the current row, so all valid positions are obtained with a few bit operations:

``` swift
var available = fullMask & ~(columns | descendingDiagonals | ascendingDiagonals)
```

The least significant available bit identifies the next column to try. After placing that queen, both diagonal masks are shifted because their attacked columns move by one position in the next row.

``` swift
let position = available & -available
available &= available - 1
```

Backtracking explores that choice and then returns to try the remaining positions. Only the selected column for each row is stored; a board is constructed after a complete valid placement is found.

### How to Recognize This Pattern

Consider **Backtracking with Bitmasks** when the search builds a solution one decision at a time, constraints eliminate many candidates, and a small fixed domain can be represented by bits.

## Explanation [_Second solution_]

The second solution uses boolean arrays instead of bitmasks. A column and both diagonals can be checked in constant time with these indexes:

``` text
column:               column
descending diagonal: row - column + n - 1
ascending diagonal:  row + column
```

For every row, try each safe column, mark its three attack lines, recurse, and undo those changes when returning. This version also maintains the board during the search, which makes the backtracking steps especially explicit.

**Algorithm X** can model N-Queens as a generalized exact-cover problem. The two Swift implementations here use direct backtracking instead because it is simpler and natural for the given limit.

## Comparing solutions

| Aspect | Optimal solution: Bitmask Backtracking | Second solution: Boolean Constraints |
|:-------|:--------------------------------------:|:------------------------------------:|
| Advantages | Compact state and fast bitwise candidate generation. | Direct indexes and easy-to-follow state changes. |
| Disadvantages | Bit shifts require a more careful explanation. | Scans every column and maintains an entire board. |
| When to use it | When performance and compact state are priorities. | When readability and teaching the backtracking process are priorities. |
| Interview recommendation | Preferred after explaining how the three masks move between rows. | A strong first solution before introducing bitmasks. |

## Complexity comparison

Let `n` be the board size and `S` the number of valid boards returned. Each board contains `n²` characters.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Bitmask Backtracking | `O(n! + S × n²)` | `O(n)` auxiliary | At most one queen is selected per row and column, which bounds the backtracking search by `O(n!)`; constructing every valid board costs `O(S × n²)`. The recursion and selected-column array use `O(n)` space. |
| Boolean Constraints | `O(n × n! + S × n²)` | `O(n²)` auxiliary | Each search state scans up to `n` columns; copying each valid board costs `O(n²)`. The maintained board uses `O(n²)` space, while the constraint arrays and recursion use `O(n)`. |

The returned `O(S × n²)` output is excluded from the auxiliary-space comparison.
