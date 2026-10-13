## Explanation [_Optimal solution_]

Maintain a stack of bars with non-decreasing heights. Each entry stores its height and the earliest index from which that height can extend.

When a shorter bar appears, every taller bar at the top has found its right boundary. Pop it and calculate the rectangle ending immediately before the current index:

``` text
area = popped height × (current index - earliest start)
```

The current bar inherits the popped bar's start because it is shorter and can extend across that entire range.

``` swift
while let last = stack.last, last.height > currentHeight {
    let bar = stack.removeLast()
    maximumArea = max(maximumArea, bar.height * (index - bar.start))
    start = bar.start
}
```

A final virtual bar of height `0` removes every remaining bar from the stack, so no separate cleanup loop is required.

### How to Recognize This Pattern

Consider a **Monotonic Increasing Stack** when every element needs the first smaller boundary on each side and unresolved elements can be completed as soon as a smaller value appears.

## Explanation [_Second solution_]

For each bar, find the first strictly shorter bar on its left and right using two monotonic-stack passes.

The largest rectangle whose height is `heights[index]` occupies every position between those shorter boundaries:

``` text
width = right boundary - left boundary - 1
area  = heights[index] × width
```

The first pass fills `leftBoundary`, and the reverse pass fills `rightBoundary`. Popping bars with equal heights ensures each boundary is strictly shorter.

## Comparing solutions

| Aspect | Optimal solution: One-Pass Stack | Second solution: Boundary Arrays |
|:-------|:--------------------------------:|:--------------------------------:|
| Advantages | Calculates areas in one pass and stores no boundary arrays. | Makes each bar's left boundary, right boundary, width, and area explicit. |
| Disadvantages | The inherited start index requires careful reasoning. | Uses two additional arrays and two stack passes. |
| When to use it | When a compact single-pass solution is preferred. | When explicit nearest-smaller boundaries make the logic easier to understand. |
| Interview recommendation | Preferred after clearly explaining what each stack entry represents. | A strong alternative for deriving the formula step by step. |

## Complexity comparison

Let `n` be the number of bars in `heights`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| One-Pass Stack | `O(n)` | `O(n)` | Each of the `n` bars enters and leaves the stack at most once; the stack may contain all bars. |
| Boundary Arrays | `O(n)` | `O(n)` | Three linear passes process the `n` bars, while two boundary arrays and the stack each require linear space. |
