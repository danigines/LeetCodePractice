## Explanation [_Optimal solution_]

The simulation follows the same movement used to write the zigzag:

```text
down → down → up → down → ...
```

For `numRows = 3`, the current row evolves as:

```text
0 → 1 → 2 → 1 → 0 → 1 → ...
```

Each character is appended to its current row. When we reach the first or last row, the direction changes.

### Why store one string per row?

The final answer is read row by row. Storing the characters directly in their destination rows makes the final operation simply:

``` swift
rows.joined()
```

### Why handle one row separately?

With one row, there is no vertical movement and the original string is already the answer. The same applies when there are at least as many rows as characters.

### How to Recognize This Pattern

Think of **Simulation** when the problem describes a sequence of movements or state changes that can be reproduced directly with a small amount of state.

Here, that state is the current row and the direction.

## Explanation [_Second solution_]

The mathematical solution reads the output row by row using the repeating zigzag cycle:

```text
cycleLength = 2 × numRows - 2
```

The first and last rows contribute one character per cycle. Middle rows can contribute a vertical character and an additional diagonal character.

### What changes compared to the optimal solution?

Simulation follows every character's movement and stores separate rows. Cycle Math calculates which source indices belong to each output row, avoiding the intermediate row array but requiring a less intuitive formula.

## Comparing solutions

| Aspect | Optimal solution: Simulation | Second solution: Cycle Math |
|:-------|:----------------------------:|:---------------------------:|
| Advantages | Intuitive, simple, and directly reproduces the zigzag. | Avoids storing separate rows and exploits the repeating cycle. |
| Disadvantages | Maintains an array of intermediate row strings. | Diagonal-index calculations are less obvious and more error-prone. |
| When to use it | When direct simulation clearly describes the transformation. | When the repeating index pattern is understood and row-by-row traversal is preferred. |
| Interview recommendation | Preferred because it is easier to explain and implement correctly. | Good alternative for demonstrating mathematical pattern recognition. |

## Complexity comparison

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Simulation | `O(n)` | `O(n)` | `n` is the number of characters in `s`. Each character is appended once, and the row strings store `n` characters in total. |
| Cycle Math | `O(n)` | `O(n)` | `n` is the number of characters. Each character is appended once, while `Array(s)` and the result require linear space. |
