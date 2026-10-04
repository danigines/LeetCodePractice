## Explanation [_Optimal solution_]

Use a one-dimensional dynamic programming array where `paths[column]` stores the number of ways to reach that column in the current row.

Before updating a cell, `paths[column]` contains the paths arriving from above, while `paths[column - 1]` already contains the paths arriving from the left:

``` text
paths[column] = paths[column] + paths[column - 1]
```

If the current cell is an obstacle, set `paths[column]` to zero. This removes every route that would pass through that cell. Initializing `paths[0]` to `1` provides the starting path; if the starting cell is blocked, the first update correctly changes it to zero.

``` swift
for row in 0..<rows {
    for column in 0..<columns {
        if obstacleGrid[row][column] == 1 {
            paths[column] = 0
        } else if column > 0 {
            paths[column] += paths[column - 1]
        }
    }
}
```

### How to Recognize This Pattern

Consider **One-Dimensional Grid DP** when movement is limited to neighboring cells from the previous row and the current row, so a full matrix is unnecessary.

## Explanation [_Second solution_]

Use depth-first search to explore the two possible moves from each cell. Return zero when a position is outside the grid or contains an obstacle, and return one when the destination is reached.

Without memoization, the same remaining subgrid would be evaluated repeatedly. Store the result for each visited cell so every state is solved at most once.

``` swift
func countPaths(_ row: Int, _ column: Int) -> Int {
    if row >= rows || column >= columns || obstacleGrid[row][column] == 1 {
        return 0
    }

    if row == rows - 1 && column == columns - 1 {
        return 1
    }

    if memo[row][column] != -1 {
        return memo[row][column]
    }

    memo[row][column] = countPaths(row + 1, column)
        + countPaths(row, column + 1)
    return memo[row][column]
}
```

## Comparing solutions

| Aspect | Optimal solution: One-Dimensional DP | Second solution: Memoized DFS |
|:-------|:------------------------------------:|:-----------------------------:|
| Advantages | Uses only one row of additional storage and processes cells iteratively. | Expresses the choices from each cell directly and avoids solving unreachable states. |
| Disadvantages | Still visits every grid cell, including cells beyond blocking regions. | Uses a full memo table and recursion stack. |
| When to use it | When minimizing auxiliary space is important. | When a recursive state transition is easier to derive or extend. |
| Interview recommendation | Preferred after explaining the recurrence and obstacle reset. | A clear alternative if recursion and memoization are acceptable. |

## Complexity comparison

Let `m` be the number of rows and `n` the number of columns in `obstacleGrid`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| One-Dimensional DP | `O(m × n)` | `O(n)` | Every grid cell is processed once, and the array stores one value per column. |
| Memoized DFS | `O(m × n)` | `O(m × n)` | Each cell is evaluated at most once; the memo table stores up to `m × n` results and dominates the recursion stack of at most `m + n` calls. |
