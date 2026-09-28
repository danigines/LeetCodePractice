## Explanation [_Optimal solution_]

Kadane's algorithm keeps the maximum sum of a subarray that must end at the current position. For each value, there are only two useful choices:

- Start a new subarray with the current value.
- Extend the best subarray ending at the previous position.

``` swift
currentSum = max(value, currentSum + value)
bestSum = max(bestSum, currentSum)
```

If the previous sum would make the current subarray worse, it is discarded. Initializing both sums with the first element also handles arrays containing only negative numbers.

### How to Recognize This Pattern

Consider **Kadane's Algorithm** when a problem asks for the best sum of a contiguous segment and the best result ending at one position depends only on the previous position.

## Explanation [_Second solution_]

Divide the array into two halves. Each segment returns four values:

``` text
total:  sum of the complete segment
prefix: best sum touching the left boundary
suffix: best sum touching the right boundary
best:   best sum anywhere in the segment
```

The parent segment combines the results from both children. Its best subarray is either entirely in the left half, entirely in the right half, or crosses the midpoint by joining the left suffix and right prefix.

``` swift
let best = max(max(left.best, right.best), left.suffix + right.prefix)
```

Because each merge takes constant time, this divide and conquer implementation remains linear rather than rescanning both halves at every recursion level.

## Comparing solutions

| Aspect | Optimal solution: Kadane's Algorithm | Second solution: Divide and Conquer |
|:-------|:------------------------------------:|:-----------------------------------:|
| Advantages | One pass with constant auxiliary space. | Directly addresses the follow-up and exposes reusable segment information. |
| Disadvantages | The local recurrence may not be immediately obvious. | Requires more state and recursion. |
| When to use it | For the simplest and most efficient one-time query. | When practicing divide and conquer or extending the idea toward a segment tree. |
| Interview recommendation | Preferred primary answer. | Explain after Kadane when the follow-up is requested. |

## Complexity comparison

Let `n` be the number of elements in `nums`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Kadane's Algorithm | `O(n)` | `O(1)` | Every element is processed once, while only the current and global maximum sums are stored. |
| Divide and Conquer | `O(n)` | `O(log n)` | The recursion processes two disjoint halves and performs constant work per segment; the balanced recursion tree has `O(log n)` depth. |
