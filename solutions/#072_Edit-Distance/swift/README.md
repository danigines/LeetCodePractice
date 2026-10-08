## Explanation [_Optimal solution_]

Let `dp[row][column]` represent the minimum operations needed to convert the first `row` characters of one word into the first `column` characters of the other word.

If the current characters match, no new operation is required, so reuse the diagonal state. Otherwise, choose the cheapest permitted operation:

``` text
if source[row - 1] == target[column - 1]:
    dp[row][column] = dp[row - 1][column - 1]
else:
    dp[row][column] = 1 + min(
        dp[row - 1][column],      // delete
        dp[row][column - 1],      // insert
        dp[row - 1][column - 1]   // replace
    )
```

Only the previous and current rows are needed. Use the shorter word as the columns to minimize auxiliary space.

``` swift
for sourceIndex in source.indices {
    current[0] = sourceIndex + 1

    for targetIndex in target.indices {
        let column = targetIndex + 1

        if source[sourceIndex] == target[targetIndex] {
            current[column] = previous[column - 1]
        } else {
            current[column] = 1 + min(
                previous[column],
                current[column - 1],
                previous[column - 1]
            )
        }
    }

    swap(&previous, &current)
}
```

### How to Recognize This Pattern

Consider **Dynamic Programming on Two Prefixes** when each operation consumes a character from one string, the other string, or both strings.

## Explanation [_Second solution_]

Define a recursive state with the current indices in both words. When either word is exhausted, the remaining characters in the other word determine the number of required insertions or deletions.

Matching characters advance both indices at no cost. Otherwise, recursively try deleting, inserting, and replacing, then add one to the smallest result. Memoization ensures every pair of indices is solved once.

``` swift
if sourceIndex == source.count {
    return target.count - targetIndex
}

if targetIndex == target.count {
    return source.count - sourceIndex
}

if source[sourceIndex] == target[targetIndex] {
    result = distance(sourceIndex + 1, targetIndex + 1)
} else {
    result = 1 + min(
        distance(sourceIndex + 1, targetIndex),
        distance(sourceIndex, targetIndex + 1),
        distance(sourceIndex + 1, targetIndex + 1)
    )
}
```

## Comparing solutions

| Aspect | Optimal solution: One-Dimensional DP | Second solution: Memoized Recursion |
|:-------|:------------------------------------:|:-----------------------------------:|
| Advantages | Minimizes auxiliary space and avoids recursion. | Mirrors the insert, delete, and replace choices directly. |
| Disadvantages | Updating the rolling rows requires careful state ordering. | Uses a full memo table and recursion stack. |
| When to use it | When only the minimum distance is required. | When first deriving the recurrence or extending operation rules. |
| Interview recommendation | Preferred after explaining the full two-dimensional recurrence. | A clear intermediate solution before reducing space. |

## Complexity comparison

Let `m` be the number of characters in `word1` and `n` the number of characters in `word2`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| One-Dimensional DP | `O(m × n)` | `O(min(m, n))` | Every pair of prefixes is processed once, while two rows use the shorter word as their width. |
| Memoized Recursion | `O(m × n)` | `O(m × n)` | Each pair of indices is solved once; the memo table dominates a recursion stack of at most `m + n` calls. |
