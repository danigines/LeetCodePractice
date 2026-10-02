## Explanation [_Optimal solution_]

Because the existing intervals are already sorted and do not overlap, process them in three consecutive groups:

``` text
intervals before newInterval
overlapping intervals
intervals after newInterval
```

First append every interval whose end is strictly before the new start. Then merge every interval whose start is at most the current merged end:

``` swift
mergedStart = min(mergedStart, interval[0])
mergedEnd = max(mergedEnd, interval[1])
```

Append the merged interval once, followed by every remaining interval. Touching endpoints count as overlap, which is why only `end < mergedStart` belongs entirely before and only `start > mergedEnd` belongs entirely after.

### How to Recognize This Pattern

Consider **Three-Phase Interval Processing** when sorted, disjoint ranges can be divided into those before, overlapping, and after a new range.

## Explanation [_Second solution_]

Append `newInterval` to the input, sort all intervals by their starting point, and apply the standard merge-intervals algorithm from problem 56.

``` swift
if interval[0] > merged[merged.count - 1][1] {
    merged.append(interval)
} else {
    merged[merged.count - 1][1] = max(
        merged[merged.count - 1][1],
        interval[1]
    )
}
```

This approach works even if the original order guarantee is removed, but it performs unnecessary sorting for this problem.

## Comparing solutions

| Aspect | Optimal solution: Three Phases | Second solution: Sort and Merge |
|:-------|:------------------------------:|:-------------------------------:|
| Advantages | Uses the existing order for one linear pass and constant auxiliary state. | Reuses a general interval-merging pattern. |
| Disadvantages | Depends on the input being sorted and non-overlapping. | Ignores that guarantee and pays for sorting. |
| When to use it | When the stated input guarantees are available. | When intervals may arrive unsorted or already overlap. |
| Interview recommendation | Preferred; explicitly identify the three groups. | Mention as a correct baseline before optimizing. |

## Complexity comparison

Let `n` be the number of intervals in `intervals`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Three Phases | `O(n)` | `O(1)` auxiliary | Every interval is inspected and appended at most once, while only the insertion index and merged endpoints are stored. |
| Sort and Merge | `O(n log n)` | `O(n)` auxiliary | Sorting the `n + 1` intervals dominates the merge pass, and Swift creates a sorted copy. |

The returned `O(n)` array is excluded from the auxiliary-space comparison.
