## Explanation [_Optimal solution_]

Because every row begins after the previous row ends, reading the matrix from left to right and top to bottom produces one globally sorted sequence.

Perform binary search over virtual indices from `0` through `rows × columns - 1`. Convert each middle index back into matrix coordinates without creating a flattened copy:

``` text
row = middle / columns
column = middle % columns
```

Then compare `matrix[row][column]` with `target` and discard half of the remaining search space.

``` swift
while left <= right {
    let middle = left + (right - left) / 2
    let value = matrix[middle / columns][middle % columns]

    if value == target {
        return true
    } else if value < target {
        left = middle + 1
    } else {
        right = middle - 1
    }
}
```

### How to Recognize This Pattern

Consider **Binary Search over Virtual Indices** when a multidimensional collection is globally ordered and an index can be mapped to its row and column in constant time.

## Explanation [_Second solution_]

Use two binary searches. First, find the last row whose first value is less than or equal to `target`. Only that row can contain the target because consecutive row ranges do not overlap.

Then perform a standard binary search inside the selected row.

``` swift
while top <= bottom {
    let middle = top + (bottom - top) / 2

    if matrix[middle][0] <= target {
        candidateRow = middle
        top = middle + 1
    } else {
        bottom = middle - 1
    }
}
```

This solution preserves the matrix structure explicitly, although it requires two search phases.

## Comparing solutions

| Aspect | Optimal solution: Virtual Flattening | Second solution: Two-Stage Binary Search |
|:-------|:------------------------------------:|:----------------------------------------:|
| Advantages | Uses one binary search and no copied array. | Separates row selection from the search within that row. |
| Disadvantages | Requires translating a virtual index into coordinates. | Requires two binary searches and candidate-row handling. |
| When to use it | When the entire matrix is globally sorted. | When reasoning about row ranges first is clearer. |
| Interview recommendation | Preferred because it is concise and directly treats the matrix as one sorted sequence. | A strong alternative that demonstrates the same ordering property in two steps. |

## Complexity comparison

Let `m` be the number of rows and `n` the number of columns in `matrix`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Virtual Flattening | `O(log(m × n))` | `O(1)` | Binary search halves a virtual sequence of `m × n` values while storing only index variables. |
| Two-Stage Binary Search | `O(log m + log n)` | `O(1)` | One binary search selects a row and another searches its `n` values; only index variables are stored. |
