## Explanation [_Optimal solution_]

Sort the intervals by their starting point. After sorting, any interval that can overlap the current merged interval appears next to it.

For each interval:

- If its start is greater than the current end, close the current interval and begin a new one.
- Otherwise, merge the overlap by extending the current end when necessary.

``` swift
if start > currentEnd {
    merged.append([currentStart, currentEnd])
    currentStart = start
    currentEnd = end
} else {
    currentEnd = max(currentEnd, end)
}
```

Intervals that only touch at one endpoint also overlap, so a new interval begins only when `start > currentEnd`.

### How to Recognize This Pattern

Consider **Sort and Merge** when ranges arrive in arbitrary order and sorting by one endpoint makes every possible overlap adjacent.

## Explanation [_Second solution_]

Separate all starts from all ends and sort both arrays. While scanning them together, `starts[index + 1]` is the next interval to open and `ends[index]` is the earliest current interval to close.

``` swift
if index == count - 1 || starts[index + 1] > ends[index] {
    merged.append([currentStart, ends[index]])
}
```

When the next start is greater than the current end, the active group of overlapping intervals is complete. This sweep produces the same merged ranges without preserving the original start–end pairs.

## Comparing solutions

| Aspect | Optimal solution: Sorted Intervals | Second solution: Separate Endpoints |
|:-------|:----------------------------------:|:-----------------------------------:|
| Advantages | Directly preserves each interval and uses one simple merge invariant. | Offers a compact sweep-line view of when overlap groups close. |
| Disadvantages | Requires mutable state for the interval currently being merged. | Creates two sorted arrays and its endpoint relationship is less intuitive. |
| When to use it | For clear production code and interviews. | When reasoning about simultaneous interval starts and ends. |
| Interview recommendation | Preferred; explain why sorting makes overlaps adjacent. | A useful alternative after the standard solution. |

## Complexity comparison

Let `n` be the number of intervals.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Sorted Intervals | `O(n log n)` | `O(n)` auxiliary | Sorting dominates the linear merge pass; Swift creates a mutable sorted copy of the input intervals. |
| Separate Endpoints | `O(n log n)` | `O(n)` auxiliary | Both endpoint arrays are sorted and then scanned once; they each store `n` values. |

The returned array of merged intervals is excluded from the auxiliary-space comparison.
