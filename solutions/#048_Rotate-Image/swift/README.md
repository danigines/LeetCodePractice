## Explanation [_Optimal solution_]

A 90-degree clockwise rotation can be decomposed into two reflections:

1. Transpose the matrix across its main diagonal.
2. Reverse every row.

``` text
1 2 3      1 4 7      7 4 1
4 5 6  →   2 5 8  →   8 5 2
7 8 9      3 6 9      9 6 3
           transpose   reverse rows
```

During transposition, visit only cells above the diagonal and exchange each `(row, column)` with `(column, row)`. Visiting both halves would swap every pair twice and restore the original matrix.

``` swift
let value = matrix[row][column]
matrix[row][column] = matrix[column][row]
matrix[column][row] = value
```

Both transformations modify the existing rows, so no second matrix is allocated.

### How to Recognize This Pattern

Consider **Matrix Transformations** when a rotation or reflection can be expressed as a sequence of simpler symmetric operations such as transposition and row or column reversal.

## Explanation [_Second solution_]

Process the matrix from the outer layer inward. For every position along a layer's top edge, rotate its four corresponding cells in one cycle:

``` text
left → top → right → bottom → left
```

If `offset` is the distance from the layer's first column, the four coordinates are:

``` text
top:    (layer, column)
right:  (column, last)
bottom: (last, last - offset)
left:   (last - offset, layer)
```

Only `⌊n / 2⌋` layers need processing. For an odd-sized matrix, the center cell stays in place.

## Comparing solutions

| Aspect | Optimal solution: Transpose and Reverse | Second solution: Four-Way Cycles |
|:-------|:---------------------------------------:|:--------------------------------:|
| Advantages | Two simple, independently understandable transformations. | Moves every group directly to its final rotated positions. |
| Disadvantages | Requires two passes over parts of the matrix. | Coordinate calculations are easier to get wrong. |
| When to use it | For clear and maintainable [**in-place**](https://en.wikipedia.org/wiki/In-place_algorithm) rotation. | When practicing layer traversal and coordinate mapping. |
| Interview recommendation | Preferred because its invariants are easy to explain. | Good alternative when asked for direct cyclic movement. |

## Complexity comparison

Let `n` be the number of rows and columns in the square matrix.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Transpose and Reverse | `O(n²)` | `O(1)` | Transposition visits half the cells and row reversal visits every cell; only one temporary value is stored. |
| Four-Way Cycles | `O(n²)` | `O(1)` | Every cell is moved once across all layers, using only indices and one temporary value. |
