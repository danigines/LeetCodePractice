## Explanation [_Optimal solution_]

Create an `n × n` matrix filled with zeros and maintain four boundaries around the unfilled area: `top`, `bottom`, `left`, and `right`.

Fill each layer clockwise while increasing `value` after every cell:

``` text
top row → right column → bottom row → left column
```

Move each completed boundary inward. The checks before the bottom and left traversals prevent the center row or column from being written twice.

This is the same shrinking-boundaries pattern used to read Spiral Matrix, but here it writes sequential values instead.

### How to Recognize This Pattern

Consider **Layer-by-Layer Matrix Construction** when a square or rectangular result follows the same perimeter order repeatedly toward its center.

## Explanation [_Second solution_]

Simulate a cursor moving right, down, left, and up. Write values from `1` through `n²` into the current cell.

``` swift
let rowDirections = [0, 1, 0, -1]
let columnDirections = [1, 0, -1, 0]
```

Before advancing, check whether the next position is outside the matrix or already contains a value. If either condition is true, rotate clockwise to the next direction. The zeros in the result matrix also act as the visited markers, so no separate boolean matrix is required.

## Comparing solutions

| Aspect | Optimal solution: Shrinking Boundaries | Second solution: Direction Simulation |
|:-------|:--------------------------------------:|:-------------------------------------:|
| Advantages | Fills one complete layer at a time with explicit limits. | Closely models walking through the spiral. |
| Disadvantages | Requires careful checks near the center. | Requires bounds, occupancy, and direction-change logic. |
| When to use it | When the spiral can be described as nested rectangular layers. | When movement rules are easier to express with direction vectors. |
| Interview recommendation | Preferred for its clear boundary invariant. | A concise alternative after explaining how turns are detected. |

## Complexity comparison

Let `n` be the side length of the generated matrix.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Shrinking Boundaries | `O(n²)` | `O(1)` auxiliary | Every one of the `n²` cells is written once, while only four boundaries and the next value are stored. |
| Direction Simulation | `O(n²)` | `O(1)` auxiliary | Every cell is written once, while the result matrix itself records which positions have been visited. |

The required `O(n²)` result matrix is excluded from the auxiliary-space comparison.
