## Explanation [_Optimal solution_]

Every valid path contains exactly `m - 1` downward moves and `n - 1` rightward moves, for a total of `m + n - 2` moves. A path is uniquely determined by choosing which positions contain one of those move types.

``` text
paths = C(m + n - 2, m - 1)
      = C(m + n - 2, n - 1)
```

Use the smaller of the two move counts and compute the binomial coefficient incrementally. `Int64` protects the intermediate multiplication before each exact division.

``` swift
for step in 1...chosenMoves {
    result = result * Int64(totalMoves - chosenMoves + step)
        / Int64(step)
}
```

### How to Recognize This Pattern

Consider **Combinatorial Path Counting** when every route contains a fixed multiset of moves and only their ordering changes.

## Explanation [_Second solution_]

Dynamic programming defines `dp[column]` as the number of paths to the current row and column. Every cell can be reached only from above or from the left:

``` text
paths(row, column) = paths(row - 1, column)
                   + paths(row, column - 1)
```

Before an update, `dp[column]` contains the paths from above; `dp[column - 1]` already contains the paths from the left in the current row. Initializing the array with ones represents the single straight path along the first row.

Use the shorter grid dimension as the DP width to reduce auxiliary space.

## Comparing solutions

| Aspect | Optimal solution: Combinatorics | Second solution: One-Dimensional DP |
|:-------|:-------------------------------:|:-----------------------------------:|
| Advantages | Computes the answer without visiting every grid cell. | Generalizes naturally to grids with varying cell rules. |
| Disadvantages | Depends on every path having the same fixed moves and no obstacles. | Performs work for every cell. |
| When to use it | For an empty rectangular grid with only right and down moves. | When deriving the recurrence or preparing for obstacle variants. |
| Interview recommendation | Present after explaining why paths correspond to combinations. | A strong initial solution that clearly demonstrates dynamic programming. |

## Complexity comparison

Let `m` be the number of rows and `n` the number of columns.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Combinatorics | `O(min(m, n))` | `O(1)` | The binomial coefficient uses the smaller move count as the number of iterations and stores only the running result. |
| One-Dimensional DP | `O(m × n)` | `O(min(m, n))` | Every grid position contributes once, while the DP array uses the shorter grid dimension. |
