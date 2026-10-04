## Explanation [_Optimal solution_]

Use a one-dimensional dynamic programming array where `minimumSums[column]` stores the minimum cost to reach that column in the current row.

Before updating a cell, `minimumSums[column]` contains the cost from above, while `minimumSums[column - 1]` already contains the cost from the left. Choose the smaller value and add the current cell:

``` text
minimumSum(row, column) = grid[row][column]
                        + min(minimumSum(row - 1, column),
                              minimumSum(row, column - 1))
```

The first cell starts with its own value. Cells in the first row can arrive only from the left, and cells in the first column can arrive only from above.

``` swift
for row in 0..<rows {
    for column in 0..<columns {
        if row == 0 && column == 0 {
            minimumSums[column] = grid[row][column]
        } else if row == 0 {
            minimumSums[column] = minimumSums[column - 1] + grid[row][column]
        } else if column == 0 {
            minimumSums[column] += grid[row][column]
        } else {
            minimumSums[column] = min(
                minimumSums[column],
                minimumSums[column - 1]
            ) + grid[row][column]
        }
    }
}
```

### How to Recognize This Pattern

Consider **One-Dimensional Grid DP** when each cell depends only on its upper and left neighbors and only the final optimal value is required.

## Explanation [_Second solution_]

Use depth-first search starting at the bottom-right cell. The minimum sum for a position is its value plus the smaller result obtained from the cell above or the cell to the left.

Return a large sentinel value for positions outside the grid so they cannot be selected as part of a valid path. Memoization stores each computed result and prevents repeated work.

``` swift
func minimumSum(_ row: Int, _ column: Int) -> Int {
    if row < 0 || column < 0 {
        return Int.max
    }

    if row == 0 && column == 0 {
        return grid[0][0]
    }

    if memo[row][column] != -1 {
        return memo[row][column]
    }

    memo[row][column] = grid[row][column] + min(
        minimumSum(row - 1, column),
        minimumSum(row, column - 1)
    )
    return memo[row][column]
}
```

## Comparing solutions

| Aspect | Optimal solution: One-Dimensional DP | Second solution: Memoized DFS |
|:-------|:------------------------------------:|:-----------------------------:|
| Advantages | Uses one value per column and avoids recursion. | Mirrors the recurrence directly and computes states on demand. |
| Disadvantages | Requires separate handling for the first row and first column. | Uses a full memo table and recursion stack. |
| When to use it | When auxiliary space should be minimized. | When the recursive recurrence is easier to explain or extend. |
| Interview recommendation | Preferred after deriving the grid recurrence. | A clear starting point before converting to bottom-up DP. |

## Complexity comparison

Let `m` be the number of rows and `n` the number of columns in `grid`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| One-Dimensional DP | `O(m × n)` | `O(n)` | Every grid cell is processed once, and the array stores one minimum sum per column. |
| Memoized DFS | `O(m × n)` | `O(m × n)` | Each cell is evaluated at most once; the memo table stores up to `m × n` results and dominates the recursion stack of at most `m + n` calls. |
