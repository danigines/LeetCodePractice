## Explanation [_Optimal solution_]

Treat every matrix row as the base of a histogram. For each column, `heights[column]` stores the number of consecutive `1` values ending at the current row:

``` swift
heights[column] = row[column] == "1" ? heights[column] + 1 : 0
```

After updating the histogram, solve **Largest Rectangle in Histogram** with a monotonic increasing stack. Each stack entry stores a height and the earliest column from which that height can extend.

When a shorter bar appears, pop every taller bar and calculate its completed rectangle. A final virtual height of `0` completes all bars still in the stack.

``` swift
while let last = stack.last, last.height > currentHeight {
    let bar = stack.removeLast()
    maximumArea = max(maximumArea, bar.height * (index - bar.start))
    start = bar.start
}
```

The maximum across all row histograms is the largest rectangle containing only `1` values.

### How to Recognize This Pattern

Consider **Reducing a Matrix to Histograms** when consecutive valid cells can be accumulated vertically and the best rectangle can be calculated independently for every possible bottom row.

## Explanation [_Second solution_]

Use dynamic programming to maintain three values for every column:

- `heights[column]`: consecutive `1` values ending at the current row.
- `leftBoundary[column]`: leftmost column available to the current rectangle.
- `rightBoundary[column]`: exclusive rightmost column available to the current rectangle.

Scan left to right to update heights and left boundaries, then right to left to update right boundaries. A `0` resets all state that cannot continue into the next row.

``` text
area = height × (right boundary - left boundary)
```

The boundary arrays retain only ranges that remain valid across every row contributing to the current height.

## Comparing solutions

| Aspect | Optimal solution: Row Histograms | Second solution: Dynamic Boundaries |
|:-------|:--------------------------------:|:-----------------------------------:|
| Advantages | Reuses the standard monotonic-stack histogram pattern directly. | Computes each rectangle from explicit persistent boundaries. |
| Disadvantages | Runs a separate stack process for every row. | Maintaining and resetting three arrays requires careful boundary logic. |
| When to use it | When problem 84 and monotonic stacks are familiar. | When expressing the solution as row-by-row dynamic programming is preferred. |
| Interview recommendation | Preferred because the matrix-to-histogram reduction is reusable and easy to justify. | A strong alternative that demonstrates the Dynamic Programming topic directly. |

## Complexity comparison

Let `r` be the number of rows and `c` the number of columns in `matrix`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Row Histograms | `O(r × c)` | `O(c)` | Each of the `r` rows updates `c` heights, and every column enters and leaves the stack at most once per row; both arrays scale with `c`. |
| Dynamic Boundaries | `O(r × c)` | `O(c)` | Three column scans are performed for each of the `r` rows, while the height and boundary arrays store `c` values each. |
