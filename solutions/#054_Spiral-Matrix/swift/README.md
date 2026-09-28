## Explanation [_Optimal solution_]

Treat the unvisited portion of the matrix as a rectangle bounded by `top`, `bottom`, `left`, and `right`. Traverse its outer layer clockwise:

``` text
top row → right column → bottom row → left column
```

After traversing one side, move its boundary inward. Before visiting the bottom row or left column, verify that a valid row or column remains; this prevents duplicates when the center is a single row or column.

No visited matrix is needed because the four boundaries completely describe which elements remain.

### How to Recognize This Pattern

Consider **Layer-by-Layer Matrix Traversal** when elements must be processed around a rectangular perimeter and the same operation repeats after shrinking all four boundaries.

## Explanation [_Second solution_]

Simulate a cursor moving right, down, left, and up. A boolean matrix records which cells have already been visited.

``` swift
let rowDirections = [0, 1, 0, -1]
let columnDirections = [1, 0, -1, 0]
```

Before every move, check whether the next position is outside the matrix or already visited. If so, rotate to the next direction and continue. The exact number of steps is `m × n`, so every cell is added once.

## Comparing solutions

| Aspect | Optimal solution: Shrinking Boundaries | Second solution: Direction Simulation |
|:-------|:--------------------------------------:|:-------------------------------------:|
| Advantages | Visits every cell without auxiliary traversal storage. | Closely models the physical spiral movement. |
| Disadvantages | Requires careful boundary checks for narrow inner layers. | Allocates a boolean entry for every cell. |
| When to use it | When constant auxiliary space is preferred. | When the movement rules may be easier to express as directions. |
| Interview recommendation | Preferred for its space efficiency. | A clear alternative if the turn condition is explained carefully. |

## Complexity comparison

Let `m` be the number of rows and `n` the number of columns in `matrix`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Shrinking Boundaries | `O(m × n)` | `O(1)` auxiliary | Every matrix element is appended exactly once, while only four boundaries are stored. |
| Direction Simulation | `O(m × n)` | `O(m × n)` auxiliary | Every cell is visited once, and the boolean matrix stores one visited flag per cell. |

The returned `O(m × n)` array is excluded from the auxiliary-space comparison.
