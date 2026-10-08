## Explanation [_Optimal solution_]

Use the first row and first column as markers. When `matrix[row][column]` is zero, mark its row in `matrix[row][0]` and its column in `matrix[0][column]`.

Because the first cell belongs to both marker areas, store two separate booleans before modifying anything: one for whether the original first row contains a zero and another for the original first column.

``` swift
for row in 1..<rows {
    for column in 1..<columns where matrix[row][column] == 0 {
        matrix[row][0] = 0
        matrix[0][column] = 0
    }
}

for row in 1..<rows {
    for column in 1..<columns {
        if matrix[row][0] == 0 || matrix[0][column] == 0 {
            matrix[row][column] = 0
        }
    }
}
```

After updating the inner cells, zero the first row and first column according to their saved booleans. This ordering preserves the markers until they are no longer needed.

### How to Recognize This Pattern

Consider **Reusing the Input as Marker Storage** when the required output overwrites the original collection and a reserved row or column can encode which regions must change.

## Explanation [_Second solution_]

Create one boolean array for rows and another for columns. During the first traversal, record every row and column that contains a zero. During the second traversal, set a cell to zero whenever either corresponding marker is true.

``` swift
var zeroRows = Array(repeating: false, count: rows)
var zeroColumns = Array(repeating: false, count: columns)

for row in 0..<rows {
    for column in 0..<columns where matrix[row][column] == 0 {
        zeroRows[row] = true
        zeroColumns[column] = true
    }
}
```

This approach is easier to reason about, but its auxiliary space grows with the matrix dimensions.

## Comparing solutions

| Aspect | Optimal solution: In-Place Markers | Second solution: Auxiliary Markers |
|:-------|:----------------------------------:|:----------------------------------:|
| Advantages | Uses constant auxiliary space. | Keeps marker state separate from the matrix and is straightforward. |
| Disadvantages | Requires careful handling of the first row and first column. | Uses additional memory proportional to the matrix dimensions. |
| When to use it | When the constant-space follow-up must be satisfied. | When clarity is preferred and `O(m + n)` extra space is acceptable. |
| Interview recommendation | Preferred after explaining why two first-area flags are necessary. | A useful starting point before optimizing the markers in place. |

## Complexity comparison

Let `m` be the number of rows and `n` the number of columns in `matrix`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| In-Place Markers | `O(m × n)` | `O(1)` | The matrix is traversed a constant number of times, and only two booleans are stored outside it. |
| Auxiliary Markers | `O(m × n)` | `O(m + n)` | Every cell is inspected and may be updated, while two marker arrays store one value per row and column. |
